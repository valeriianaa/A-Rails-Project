class CiudadesController < ApplicationController
  before_action :set_ciudad, only: [:show, :edit, :update, :destroy]

  # GET /ciudades
  # GET /ciudades.json
  def index
    @ciudades = Ciudad.all
  end

  # GET /ciudades/1
  # GET /ciudades/1.json
  def show
  end

  # GET /ciudades/new
  def new
    @ciudad = Ciudad.new
  end

  # GET /ciudades/1/edit
  def edit
  end

  # POST /ciudades
  # POST /ciudades.json
  def create
    @ciudad = Ciudad.new(ciudad_params)

    respond_to do |format|
      if @ciudad.save
        format.html { redirect_to @ciudad, notice: 'Ciudad fue creada exitosamente.' }
        format.json { render :show, status: :created, location: @ciudad }
      else
        format.html { render :new }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ciudades/1
  # PATCH/PUT /ciudades/1.json
  def update
    respond_to do |format|
      if @ciudad.update(ciudad_params)
        format.html { redirect_to @ciudad, notice: 'Ciudad fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @ciudad }
      else
        format.html { render :edit }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciudades/1
  # DELETE /ciudades/1.json
  def destroy
    respond_to do |format|
      if @ciudad.destroy
        format.html { redirect_to ciudades_url, notice: 'Ciudad fue eliminada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'La Ciudad no pudo ser eliminada.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ciudad
      @ciudad = Ciudad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciudad_params
      params.require(:ciudad).permit(:nombre, :pais_id, :provincia_id)
    end
end
