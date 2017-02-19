class PagosController < ApplicationController
  before_action :set_pago, only: [:show, :edit, :update, :destroy]

  # GET /pagos_realizados
  # GET /pagos_realizados.json
  def index
    @pagos = Pago.all
  end

  # GET /pagos_realizados/1
  # GET /pagos_realizados/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PagoPdf.new(@pago)
        send_data pdf.render, filename: "pago_#{@pago.id}.pdf", type: "application/pdf", disposition: "inline"
      end
    end 
  end

  # GET /pagos_realizados/new
  def new
    @pago = Pago.new
    @pago.pagos_metodos.build
  end

  # GET /pagos_realizados/1/edit
  def edit
  end

  # POST /pagos_realizados
  # POST /pagos_realizados.json
  def create
    @pago = Pago.new(pago_params)
    @pago.update_descuentos_cuotas(cuotas_params)

    respond_to do |format|
      if @pago.save
        format.html { redirect_to @pago, notice: 'Pago was successfully created.' }
        format.json { render :show, status: :created, location: @pago }
      else
        format.html { render :new }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagos_realizados/1
  # PATCH/PUT /pagos_realizados/1.json
  def update
    respond_to do |format|
      if @pago.update(pago_params)
        # CuotaPorCliente.update(@pago.cuota_por_cliente.id, montoAcreditado: @pago.cuota_por_cliente.setear_monto_acreditado(@pago.cuota_por_cliente))
        #@pago.cuota_por_cliente.montoAcreditado = @pago.cuota_por_cliente.setear_monto_acreditado(@pago.cuota_por_cliente)
        format.html { redirect_to @pago, notice: 'Pago  was successfully updated.' }
        format.json { render :show, status: :ok, location: @pago }
      else
        format.html { render :edit }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagos_realizados/1
  # DELETE /pagos_realizados/1.json
  def destroy
    @cuenta = Cuenta.find(params[:pago][:cuenta_id])
    pm_monto = 0
    cuotas_monto = 0
    @pago_metodos.each do |pm|
      pm_monto = pm_monto + pm.monto
    end
    @pago.cuotas_por_cliente.each do |c|
      cuotas_monto = cuotas_monto + c.montoTotal
      cuota.update(estado: false)
    end
    @cuenta.saldo = @cuenta.saldo - pago.monto
    @pago.destroy
    respond_to do |format|
      format.html { redirect_to pagos_url, notice: 'Pago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ajax_table_cuotas
    @proyecto = Proyecto.find(params[:pago][:proyecto_id])
    @cuotas = CuotaPorCliente.where(proyecto_id: @proyecto.id, estado: false)
    
    render :partial => "cuota.html"
    
  end

  def ajax_gon_variables
    @proyecto = Proyecto.find(params[:pago][:proyecto_id])
    @contrato = Contrato.where('fecha_inicio < ? AND fecha_fin > ? AND proyecto_id = ?', Date.today, Date.today, @proyecto.id).first
    @cuenta = Cuenta.where(proyecto_id: @proyecto.id).first
    @responsable = Persona.find(@contrato.persona_id)

    render json: {
      proyecto: @proyecto.nombre,
      saldo: @cuenta.try(:saldo),
      responsable: @responsable.nombre_y_apellido,
      responsable_id: @contrato.try(:persona_id),
      cuenta_id: @cuenta.try(:id)
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago
      @pago = Pago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pago_params
      parametros = params.require(:pago).permit(
        :fecha, 
        :montoAcreditado, 
        :proyecto_id, 
        :persona_id, 
        :cuenta_id,
        :monto, 
        :tipo_de_pago_id,
        :cuota_por_cliente_ids => [],
        :pagos_metodos_attributes => [ :id, :monto, :pago_id, :tipo_de_pago_id, :_destroy ]
      )
    end

    def cuotas_params
      if params[:pago].key?(:cuota_por_cliente_ids)
        ctas_ids = params.require(:pago).require(:cuota_por_cliente_ids)
        parametros = params.require(:pago).require(:cuotas_por_cliente_attributes).select do |index, cuota| 
          ctas_ids.include?(cuota[:id])
        end
        return parametros.to_a.map{|e| e[1]}  
      else
        return []
      end
    end
end
