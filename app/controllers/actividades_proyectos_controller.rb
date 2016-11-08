class ActividadesProyectosController < ApplicationController
  before_action :set_actividad_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /actividades_proyectos
  # GET /actividades_proyectos.json
  def index
    @actividades_proyectos = ActividadProyecto.all
  end

  # GET /actividades_proyectos/1
  # GET /actividades_proyectos/1.json
  def show
  end

  # GET /actividades_proyectos/new
  def new
    @actividad_proyecto = ActividadProyecto.new
  end

  # GET /actividades_proyectos/1/edit
  def edit
  end

  # POST /actividades_proyectos
  # POST /actividades_proyectos.json
  def create
    @actividad_proyecto = ActividadProyecto.new(actividad_proyecto_params)

    respond_to do |format|
      if @actividad_proyecto.save
        format.html { redirect_to @actividad_proyecto, notice: 'Actividad proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @actividad_proyecto }
      else
        format.html { render :new }
        format.json { render json: @actividad_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividades_proyectos/1
  # PATCH/PUT /actividades_proyectos/1.json
  def update
    respond_to do |format|
      if @actividad_proyecto.update(actividad_proyecto_params)
        format.html { redirect_to @actividad_proyecto, notice: 'Actividad proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @actividad_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @actividad_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividades_proyectos/1
  # DELETE /actividades_proyectos/1.json
  def destroy
    @actividad_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to actividades_proyectos_url, notice: 'Actividad proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividad_proyecto
      @actividad_proyecto = ActividadProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividad_proyecto_params
      params.require(:actividad_proyecto).permit(:proyecto_id, :actividad_id, :fechaInicio, :fechaFinEstimada, :fechaFinActual)
      #params.require(:actividad_proyecto).permit(:fechaInicio, :fechaFin)
    end
end
