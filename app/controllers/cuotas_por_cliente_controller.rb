class CuotasPorClienteController < ApplicationController
  before_action :set_cuota_por_cliente, only: [:show, :edit, :update, :destroy]

  # GET /contratos
  # GET /contratos.json
  def index
    @cuotas_por_cliente = CuotaPorCliente.all
  end

  # GET /contratos/1
  # GET /contratos/1.json
  def show
  end

  # GET /contratos/new
  def new
    @cuota_por_cliente = CuotaPorCliente.new
  end

  # GET /contratos/1/edit
  def edit
  end

  # POST /contratos
  # POST /contratos.json
  def create
    @cuota_por_cliente = CuotaPorCliente.new(cuota_por_cliente_params)
    @cuota_por_cliente.montoTotal = @cuota_por_cliente.setear_monto_total
    @cuota_por_cliente.montoAcreditado = @cuota_por_cliente.setear_monto_acreditado

    respond_to do |format|
      if @cuota_por_cliente.save
        format.html { redirect_to @cuota_por_cliente, notice: 'CuotaPorCliente was successfully created.' }
        format.json { render :show, status: :created, location: @cuota_por_cliente }
      else
        format.html { render :new }
        format.json { render json: @cuota_por_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contratos/1
  # PATCH/PUT /contratos/1.json
  def update
     @cuota_por_cliente.montoTotal = @cuota_por_cliente.setear_monto_total
    respond_to do |format|
      if @cuota_por_cliente.update(cuota_por_cliente_params)
        format.html { redirect_to @cuota_por_cliente, notice: 'CuotaPorCliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @cuota_por_cliente }
      else
        format.html { render :edit }
        format.json { render json: @cuota_por_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contratos/1
  # DELETE /contratos/1.json
  def destroy
    @cuota_por_cliente.destroy
    respond_to do |format|
      format.html { redirect_to cuotas_por_cliente_url, notice: 'CuotaPorCliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuota_por_cliente
      @cuota_por_cliente = CuotaPorCliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuota_por_cliente_params
      params.require(:cuota_por_cliente).permit(:mensaje, :concepto_de_pago_id, :proyecto_id, :interes_id, :descuento_id, :montoTotal, :montoAcreditado)
    end
end
