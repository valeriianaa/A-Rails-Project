class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /proyectos
  # GET /proyectos.json
  def index
    @proyectos = Proyecto.all
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
  end

  # GET /proyectos/1/edit
  def edit
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        if @proyecto.etapa_id != nil
          Actividad.where(:etapa_id => @proyecto.etapa_id).each do |act|
            ap = ActividadProyecto.new
            ap.proyecto_id= @proyecto.id 
            ap.actividad_id = act.id
            ap.fechaInicio, ap.fechaFin = Date.today
            ap.save
          end
        end
        format.html { redirect_to @proyecto, notice: 'Proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @proyecto }
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    etapaId_vieja = @proyecto.etapa_id
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        if @proyecto.etapa_id != etapaId_vieja
          Actividad.where(:etapa_id => @proyecto.etapa_id).each do |act|
            ap = ActividadProyecto.new
            ap.proyecto_id= @proyecto.id 
            ap.actividad_id = act.id
            ap.fechaInicio, ap.fechaFin = Date.today
            ap.save
          end
        end
        format.html { redirect_to @proyecto, notice: 'Proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyecto }
      else
        format.html { render :edit }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: 'Proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def actividadesProyecto
    #add_breadcrumb 'Pedidos'
    @proyecto = Proyecto.find(params[:id])

    respond_to do |format|
      format.html { render 'actividades_del_proyecto.html.slim' }
      format.json { render json: @proyecto }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(:nombre, :descripcion, :calle, :nroDomicilio, :piso, :dpto, :telefono, :email, :pagWeb, {:persona_ids => []}, :etapa_id, :pais_id, :provincia_id, :ciudad_id)
      #{:persona_ids => []}
    end
end
