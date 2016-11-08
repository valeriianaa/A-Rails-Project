class PagosRealizadosController < ApplicationController
  before_action :set_pago_realizado, only: [:show, :edit, :update, :destroy]

  # GET /pagos_realizados
  # GET /pagos_realizados.json
  def index
    @pagos_realizados = PagoRealizado.all
  end

  # GET /pagos_realizados/1
  # GET /pagos_realizados/1.json
  def show
  end

  # GET /pagos_realizados/new
  def new
    @pago_realizado = PagoRealizado.new
  end

  # GET /pagos_realizados/1/edit
  def edit
  end

  # POST /pagos_realizados
  # POST /pagos_realizados.json
  def create
    @pago_realizado = PagoRealizado.new(pago_realizado_params)

    respond_to do |format|
      if @pago_realizado.save
        format.html { redirect_to @pago_realizado, notice: 'Pago realizado was successfully created.' }
        format.json { render :show, status: :created, location: @pago_realizado }
      else
        format.html { render :new }
        format.json { render json: @pago_realizado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagos_realizados/1
  # PATCH/PUT /pagos_realizados/1.json
  def update
    respond_to do |format|
      if @pago_realizado.update(pago_realizado_params)
        format.html { redirect_to @pago_realizado, notice: 'Pago realizado was successfully updated.' }
        format.json { render :show, status: :ok, location: @pago_realizado }
      else
        format.html { render :edit }
        format.json { render json: @pago_realizado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagos_realizados/1
  # DELETE /pagos_realizados/1.json
  def destroy
    @pago_realizado.destroy
    respond_to do |format|
      format.html { redirect_to pagos_realizados_url, notice: 'Pago realizado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago_realizado
      @pago_realizado = PagoRealizado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pago_realizado_params
      params.require(:pago_realizado).permit(:fecha, :monto)
    end
end
