class CuotasPorClienteController < ApplicationController
  before_action :set_cuota_por_cliente, only: [:show, :destroy]
  #before_action :set_cuota_por_cliente, only: [:show, :edit, :update, :destroy]

  # GET /contratos
  # GET /contratos.json
  def index
    @proyecto = Proyecto.find(params[:proyecto_id])
    @cuotas_por_cliente = @proyecto.cuotas_por_cliente.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CuotasPorClientePdf.new(@cuotas_por_cliente)
        send_data pdf.render, filename: "cuotas_por_cliente#{@cuotas_por_cliente}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
  end

  # GET /contratos/1
  # GET /contratos/1.json
  def show
  end

  # GET /contratos/new
  def new
    @proyecto = Proyecto.find(params[:proyecto_id])
    @cuota_por_cliente = @proyecto.cuotas_por_cliente.new
  end

  # GET /contratos/1/edit
  def edit
  end

  # POST /contratos
  # POST /contratos.json
  def create
    @proyecto = Proyecto.find(params[:proyecto_id])
    @cuota_por_cliente = @proyecto.cuotas_por_cliente.new(cuota_por_cliente_params)

    respond_to do |format|
      if @cuota_por_cliente.save
        format.html { redirect_to [@cuota_por_cliente.proyecto, @cuota_por_cliente], notice: 'Cuota fue añadida exitosamente.' }
        format.json { render :show, status: :created, location: @cuota_por_cliente }
      else
        format.html { render :new }
        format.json { render json: @cuota_por_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contratos/1
  # PATCH/PUT /contratos/1.json
  # def update
  #   @proyecto = Proyecto.find(params[:proyecto_id])
  #   @cuota_por_cliente = @proyecto.cuotas_por_cliente.find(params[:id])
  #   @cuota_por_cliente.montoTotal = @cuota_por_cliente.setear_monto_total
  #   respond_to do |format|
  #     if @cuota_por_cliente.update(cuota_por_cliente_params)
  #       format.html { redirect_to [@cuota_por_cliente.proyecto, @cuota_por_cliente], notice: 'CuotaPorCliente was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @cuota_por_cliente }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @cuota_por_cliente.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /contratos/1
  # DELETE /contratos/1.json
  def destroy
    @proyecto = Proyecto.find(params[:proyecto_id])
    @cuota_por_cliente = @proyecto.cuotas_por_cliente.find(params[:id])
    @cuota_por_cliente.destroy
    respond_to do |format|
      format.html { redirect_to proyecto_cuotas_por_cliente_url, notice: 'Cuota fue destruida exitosamente.' }
      format.json { head :no_content }
    end
  end

  def audited
    @proyecto = Proyecto.find(params[:id])
    @auditoria = Array.new
    @proyecto.cuotas_por_cliente.each do |cp|
      cp.audits.each do |a|
        @auditoria << a
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuota_por_cliente
      @proyecto = Proyecto.find(params[:proyecto_id])
      @cuota_por_cliente = @proyecto.cuotas_por_cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuota_por_cliente_params
      params.require(:cuota_por_cliente).permit(:concepto_de_pago_id, :montoTotal, :estado, :proyecto_id, :contrato_id, :descuento_id)
    end
end
