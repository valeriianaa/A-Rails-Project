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
  end

  # GET /pagos_realizados/new
  def new
    @pago = Pago.new
  end

  # GET /pagos_realizados/1/edit
  def edit
  end

  # POST /pagos_realizados
  # POST /pagos_realizados.json
  def create
    @pago = Pago.new(pago_params)
    @cuotas_por_cliente = CuotaPorCliente.find(params[:pago][:cuota_por_cliente_ids])
    #@cuenta = Cuenta.find(params[:pago][:cuenta_id])

    @pago.monto = 0
    montoAcreditado = 0
    @cuotas_por_cliente.each do |cuota|
      puts "pago, conceptos", cuota
      #@pago.monto = @pago.monto + cuota.montoTotal
    end
    puts "@pago", @pago
    #puts "@pago_metodos", @pagos_metodos
    @pago.pagos_metodos.each do |pm|
      montoAcreditado = montoAcreditado + pm.monto
    end
    if @cuenta.saldo > 0
      @pago.monto = @pago.monto -  @cuenta.saldo
      if montoAcreditado > @pago.monto
         @cuenta.saldo = montoAcreditado - @pago.monto
      end
    elsif  @cuenta.saldo == 0
      if montoAcreditado > @pago.monto
         @cuenta.saldo = montoAcreditado - @pago.monto
      end
    end

    respond_to do |format|
      # if @pago.save
      if false
        @cuotas_por_cliente.each do |cuota|
          cuota.update(estado: true, pago_id: @pago.id)
        end
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
        CuotaPorCliente.update(@pago.cuota_por_cliente.id, montoAcreditado: @pago.cuota_por_cliente.setear_monto_acreditado(@pago.cuota_por_cliente))
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
    pm_monto = 0
    cuotas_monto = 0
    @pago_metodos.each do |pm|
      pm_monto = pm_monto + pm.monto
    end
    @pago.cuotas_por_cliente.each do |c|
      cuotas_monto = cuotas_monto + c.montoTotal
      cuota.update(estado: false)
    end
    saldo = saldo - pago.monto
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago
      @pago = Pago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pago_params
      params.require(:pago).permit(
        :cuota_por_cliente_id, 
        :fecha, 
        :montoAcreditado, 
        :proyecto_id, 
        :persona_id, 
        :cuenta_id,
        :montoAPagar, 
        :tipo_de_pago_id,
        :cuota_por_cliente_ids => [],
        :cuotas_por_cliente_attributes => [:id, :descuento_id],
        :pagos_metodos_attributes => [ :id, :monto, :pago_id, :tipo_de_pago_id, :_destroy ] 
      )
    end
end
