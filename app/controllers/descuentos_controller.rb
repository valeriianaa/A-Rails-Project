class DescuentosController < ApplicationController
  before_action :set_descuento, only: [:show, :edit, :update, :destroy]

  # GET /descuentos
  # GET /descuentos.json
  def index
    @descuentos = Descuento.all
  end

  # GET /descuentos/1
  # GET /descuentos/1.json
  def show
  end

  # GET /descuentos/new
  def new
    @descuento = Descuento.new
  end

  # GET /descuentos/1/edit
  def edit
  end

  # POST /descuentos
  # POST /descuentos.json
  def create
    @descuento = Descuento.new(descuento_params)

    respond_to do |format|
      if @descuento.save
        format.html { redirect_to @descuento, notice: 'Descuento was successfully created.' }
        format.json { render :show, status: :created, location: @descuento }
      else
        format.html { render :new }
        format.json { render json: @descuento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /descuentos/1
  # PATCH/PUT /descuentos/1.json
  def update
    respond_to do |format|
      if @descuento.update(descuento_params)
        format.html { redirect_to @descuento, notice: 'Descuento was successfully updated.' }
        format.json { render :show, status: :ok, location: @descuento }
      else
        format.html { render :edit }
        format.json { render json: @descuento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descuentos/1
  # DELETE /descuentos/1.json
  def destroy
    @descuento.destroy
    respond_to do |format|
      format.html { redirect_to descuentos_url, notice: 'Descuento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_descuento
      @descuento = Descuento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def descuento_params
      params.require(:descuento).permit(:nombre, :descripcion, :porcentaje)
    end
end
