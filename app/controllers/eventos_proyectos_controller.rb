class EventosProyectosController < ApplicationController
  before_action :set_evento_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /eventos_proyectos
  # GET /eventos_proyectos.json
  def index
    @eventos_proyectos = EventoProyecto.all
  end

  # GET /eventos_proyectos/1
  # GET /eventos_proyectos/1.json
  def show
  end

  # GET /eventos_proyectos/new
  def new
    @evento_proyecto = EventoProyecto.new
  end

  # GET /eventos_proyectos/1/edit
  def edit
  end

  # POST /eventos_proyectos
  # POST /eventos_proyectos.json
  def create
    @evento_proyecto = EventoProyecto.new(evento_proyecto_params)

    respond_to do |format|
      if @evento_proyecto.save
        format.html { redirect_to @evento_proyecto, notice: 'Evento y Proyecto fueron asociados exitosamente.' }
        format.json { render :show, status: :created, location: @evento_proyecto }
      else
        format.html { render :new }
        format.json { render json: @evento_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos_proyectos/1
  # PATCH/PUT /eventos_proyectos/1.json
  def update
    respond_to do |format|
      if @evento_proyecto.update(evento_proyecto_params)
        format.html { redirect_to @evento_proyecto, notice: 'Evento y Proyecto fueron actualizados exitosamente.' }
        format.json { render :show, status: :ok, location: @evento_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @evento_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos_proyectos/1
  # DELETE /eventos_proyectos/1.json
  def destroy
    @evento_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to eventos_proyectos_url, notice: 'Evento proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "EventoProyecto"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento_proyecto
      @evento_proyecto = EventoProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_proyecto_params
      params.require(:evento_proyecto).permit(:proyecto_id, :evento_id)
    end
end
