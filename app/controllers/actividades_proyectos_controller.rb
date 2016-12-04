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
    puts 'hola soy un historial'
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
    puts 'lalalalalaalalal'
    puts params[:actividad_proyecto][:unEstado]
    una_fecha_aux = Time.new(params[:actividad_proyecto]['unaFecha(1i)'], params[:actividad_proyecto]['unaFecha(2i)'], params[:actividad_proyecto]['unaFecha(3i)'], params[:actividad_proyecto]['unaFecha(4i)'], params[:actividad_proyecto]['unaFecha(5i)'])
    puts una_fecha_aux
    puts @actividad_proyecto.unEstado
    h = Historial.new(estado_id: params[:actividad_proyecto][:unEstado], fechaHora: una_fecha_aux, actividad_proyecto_id: @actividad_proyecto.id, proyecto_id: @actividad_proyecto.proyecto_id)
    #@h.actividad_proyecto_id = @actividad_proyecto.id
    #h.estado_id = nil
    puts 'historial estado'
    puts h.estado_id 
    #@h.fechaHora = @actividad_proyecto.unaFecha
    puts 'historial fecha'
    puts h.fechaHora 
    @actividad_proyecto.estado_id = h.estado_id

    respond_to do |format|
      
      if (h.estado_id != nil)
        h.save
      end
      f = Historial.where(actividad_proyecto_id: @actividad_proyecto.id).last
      puts f
      if @actividad_proyecto.update(actividad_proyecto_params)
        format.html { redirect_to @actividad_proyecto, notice: 'Actividad proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @actividad_proyecto }
        @actividad_proyecto.transicion_sig_etapa
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
  
  # def estado_ultimo_y_obligatorio
  #   retorno = false
  #   h = Historial.where(actividad_proyecto_id: @actividad_proyecto.id).last
  #   if h.estado.ultimo == true
  #     a = Actividad.find(@actividad_proyecto.actividad_id)
  #     if a.obligatorio == true
  #       retorno = true
  #     end
  #   end
  #   return retorno
  # end

  # def transicion_sig_etapa
  #   cant_obligatorias = Actividad.where(etapa_id: @actividad_proyecto.proyecto.etapa_id, obligatorio: true).count
  #   obl_y_comp = 0
  #   etapa_actual = Etapa.find(@actividad_proyecto.proyecto.etapa_id)
  #   ActividadProyecto.where(proyecto_id: @actividad_proyecto.proyecto_id, actividad_id: Actividad.where(etapa_id: @actividad_proyecto.proyecto.etapa_id)).each do |act|
  #         if act.estado_ultimo_y_obligatorio == true
  #           obl_y_comp =+ 1
  #         end     
  #   end
  #   if cant_obligatorias == obl_y_comp
  #     Proyecto.update(@actividad_proyecto.proyecto_id, etapa_id: Etapa.where(etapaAnterior: etapa_actual))
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividad_proyecto
      @actividad_proyecto = ActividadProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividad_proyecto_params
      params.require(:actividad_proyecto).permit(:proyecto_id, :actividad_id, :unaFecha, :unEstado,:estado_id,{:historiales =>[:id, :estado_id, :actividad_proyecto_id, :fechaHora]}) 
        #{:historiales => [:id, :estado_id, :actividad_proyecto_id, :fechaHora]})
      #, historiales_attributes: [:id, :estado_id, :actividad_proyecto_id, :fechaHora]
      #params.require(:actividad_proyecto).permit(:fechaInicio, :fechaFin)
    end

    #def hist_params
      #params.fetch(:actividad_proyecto).permit(historiales_attributes: [:id, :estado_id, :actividad_proyecto_id, :fechaHora])
    #  params.require(:actividad_proyecto).permit(:historiales =>[:id, :estado_id, :actividad_proyecto_id, :fechaHora])
    #end
end
