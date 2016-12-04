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

    respond_to do |format|
      if @pago.save
        CuotaPorCliente.update(@pago.cuota_por_cliente.id, montoAcreditado: @pago.cuota_por_cliente.setear_monto_acreditado(@pago.cuota_por_cliente))
        #@pago.cuota_por_cliente.montoAcreditado = @pago.cuota_por_cliente.setear_monto_acreditado(@pago.cuota_por_cliente)
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
    @pago.destroy
    respond_to do |format|
      format.html { redirect_to pagos_url, notice: 'Pago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago
      @pago = Pago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pago_params
      params.require(:pago).permit(:cuota_por_cliente_id, :fecha, :montoAcreditado, :proyecto_id, :persona_id, :montoAPagar, :tipo_de_pago_id)
    end
end
