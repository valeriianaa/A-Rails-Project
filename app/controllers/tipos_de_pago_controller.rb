class TiposDePagoController < ApplicationController
  before_action :set_tipo_de_pago, only: [:show, :edit, :update, :destroy]

  # GET /tipos_de_pago
  # GET /tipos_de_pago.json
  def index
    @tipos_de_pago = TipoDePago.all
  end

  # GET /tipos_de_pago/1
  # GET /tipos_de_pago/1.json
  def show
  end

  # GET /tipos_de_pago/new
  def new
    @tipo_de_pago = TipoDePago.new
  end

  # GET /tipos_de_pago/1/edit
  def edit
  end

  # POST /tipos_de_pago
  # POST /tipos_de_pago.json
  def create
    @tipo_de_pago = TipoDePago.new(tipo_de_pago_params)

    respond_to do |format|
      if @tipo_de_pago.save
        format.html { redirect_to @tipo_de_pago, notice: 'Tipo de pago was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_de_pago }
      else
        format.html { render :new }
        format.json { render json: @tipo_de_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos_de_pago/1
  # PATCH/PUT /tipos_de_pago/1.json
  def update
    respond_to do |format|
      if @tipo_de_pago.update(tipo_de_pago_params)
        format.html { redirect_to @tipo_de_pago, notice: 'Tipo de pago was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_de_pago }
      else
        format.html { render :edit }
        format.json { render json: @tipo_de_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_de_pago/1
  # DELETE /tipos_de_pago/1.json
  def destroy
    @tipo_de_pago.destroy
    respond_to do |format|
      format.html { redirect_to tipos_de_pago_url, notice: 'Tipo de pago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_de_pago
      @tipo_de_pago = TipoDePago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_de_pago_params
      params.require(:tipo_de_pago).permit(:nombre, :monto, :plazoInicio, :plazoFin)
    end
end
