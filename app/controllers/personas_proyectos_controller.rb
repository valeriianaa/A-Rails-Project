class PersonasProyectosController < ApplicationController
  before_action :set_persona_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /personas_proyectos
  # GET /personas_proyectos.json
  def index
    @personas_proyectos = PersonaProyecto.all
  end

  # GET /personas_proyectos/1
  # GET /personas_proyectos/1.json
  def show
  end

  # GET /personas_proyectos/new
  def new
    @persona_proyecto = PersonaProyecto.new
  end

  # GET /personas_proyectos/1/edit
  def edit
  end

  # POST /personas_proyectos
  # POST /personas_proyectos.json
  def create
    @persona_proyecto = PersonaProyecto.new(persona_proyecto_params)

    respond_to do |format|
      if @persona_proyecto.save
        format.html { redirect_to @persona_proyecto, notice: 'Persona proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @persona_proyecto }
      else
        format.html { render :new }
        format.json { render json: @persona_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas_proyectos/1
  # PATCH/PUT /personas_proyectos/1.json
  def update
    respond_to do |format|
      if @persona_proyecto.update(persona_proyecto_params)
        format.html { redirect_to @persona_proyecto, notice: 'Persona proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @persona_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @persona_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas_proyectos/1
  # DELETE /personas_proyectos/1.json
  def destroy
    @persona_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to personas_proyectos_url, notice: 'Persona proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona_proyecto
      @persona_proyecto = PersonaProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_proyecto_params
      params.require(:persona_proyecto).permit(:persona_id, :proyecto_id)
      #params.fetch(:persona_proyecto, {})
    end
end
