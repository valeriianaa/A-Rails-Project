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
    h = Historial.new
  end

  # POST /actividades_proyectos
  # POST /actividades_proyectos.json
  def create
    @actividad_proyecto = ActividadProyecto.new(actividad_proyecto_params)
    #@historial = actividad_proyecto.historiales.new()
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
    puts params[:actividad_proyecto][:unEstado]
    una_fecha_aux = Time.new(params[:actividad_proyecto]['unaFecha(1i)'], params[:actividad_proyecto]['unaFecha(2i)'], params[:actividad_proyecto]['unaFecha(3i)'], params[:actividad_proyecto]['unaFecha(4i)'], params[:actividad_proyecto]['unaFecha(5i)'])
    puts una_fecha_aux
    puts @actividad_proyecto.unEstado
    h = Historial.new(estado_id: params[:actividad_proyecto][:unEstado], fechaHora: una_fecha_aux, actividad_proyecto_id: @actividad_proyecto.id, proyecto_id: @actividad_proyecto.proyecto_id)
    #@h.actividad_proyecto_id = @actividad_proyecto.id
    #h.estado_id = nil
    #@h.fechaHora = @actividad_proyecto.unaFecha
    @actividad_proyecto.estado_id = h.estado_id

    respond_to do |format|
      
      if (h.estado_id != nil)
        h.save
      end
      f = Historial.where(actividad_proyecto_id: @actividad_proyecto.id).last
      puts f
      if @actividad_proyecto.update(actividad_proyecto_params)
        if f.estado.ultimo == true
          if @actividad_proyecto.estado_ultimo_y_obligatorio == true
            if @actividad_proyecto.obligatorias_completadas == true
              unProyecto = Proyecto.find(@actividad_proyecto.proyecto_id)
              etapaAnterior = unProyecto.etapa_id
              etapaSiguiente = Etapa.where(etapaAnterior: etapaAnterior)
              #unProyecto.update(etapa_id: etapaSiguiente.pluck(:id)[0].to_i)
              #Rails.logger.info(unProyecto.errors.inspect)
              #unProyecto.anadir_actividades
              #flash[:notice] = "Tu proyecto ha avanzado a la siguiente etapa"
              puts 'no esta haciendo lo que queremos :('
            end
          end
        end
        format.html { redirect_to @actividad_proyecto, notice: 'Actividad proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @actividad_proyecto }
        # if @actividad_proyecto.obligatorias_completadas == true
        #   @actividad_proyecto.proyecto.transicion_siguiente_etapa(@actividad_proyecto.proyecto_id)
        # end
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

  def historial
    #add_breadcrumb 'Pedidos'
    #@proyecto = Proyecto.find(params[:id])
    #@act_proyecto = ActividadProyecto.where(:proyecto_id => @proyecto.id)

    respond_to do |format|
      format.html { render 'historial.html.slim' }
      format.json { render json: @proyecto }
    end
  end
  
  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "ActividadProyecto"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividad_proyecto
      @actividad_proyecto = ActividadProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividad_proyecto_params
      params.require(:actividad_proyecto).permit(:proyecto_id, :actividad_id, :fechaVencimiento, :unEstado, :unaFecha, :estado_id,{:historiales =>[:id, :estado_id, :actividad_proyecto_id, :fechaHora]}) 
        #{:historiales => [:id, :estado_id, :actividad_proyecto_id, :fechaHora]})
      #, historiales_attributes: [:id, :estado_id, :actividad_proyecto_id, :fechaHora]
      #params.require(:actividad_proyecto).permit(:fechaInicio, :fechaFin)
    end

    #def hist_params
      #params.fetch(:actividad_proyecto).permit(historiales_attributes: [:id, :estado_id, :actividad_proyecto_id, :fechaHora])
    #  params.require(:actividad_proyecto).permit(:historiales =>[:id, :estado_id, :actividad_proyecto_id, :fechaHora])
    #end
end
