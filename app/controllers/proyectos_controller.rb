class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /proyectos
  # GET /proyectos.json
  def index
    @proyectos = Proyecto.all
    respond_to do |format|
      format.html
      #format.csv { send_data @contactos.to_csv, filename: "contactos-#{Date.today}.csv" }
      format.xls
    end
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
    respond_to do |format|
      if @proyecto.update(proyecto_params)
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
      format.pdf do
        pdf = ActividadesProyectoPdf.new(@proyecto)
        send_data pdf.render, filename: "actividades_del_proyecto#{@proyecto}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def contratosProyecto
    #add_breadcrumb 'Pedidos'
    @proyecto = Proyecto.find(params[:id])
    respond_to do |format|
      format.html { render 'contratos_del_proyecto.html.slim' }
      format.json { render json: @proyecto }
    end
  end

  def pagosProyecto
    #add_breadcrumb 'Pedidos'
    @proyecto = Proyecto.find(params[:id])
    respond_to do |format|
      format.html { render 'pagos_del_proyecto.html.slim' }
      format.json { render json: @proyecto }
    end
  end

  def eventosProyecto
    #add_breadcrumb 'Pedidos'
    @proyecto = Proyecto.find(params[:id])
    respond_to do |format|
      format.html { render 'eventos_del_proyecto.html.slim' }
      format.json { render json: @proyecto }
    end
  end

  def proyectos_abandonados
    @proyectos = Array.new
    Proyecto.all.each do |p|
      if p.abandonado == true
        @proyectos << p
      end
    end

    respond_to do |format|
      format.html { render "proyectos_abandonados.html.slim"}
      #format.json { render json: @productos }
    end
  end

  def proyectos_con_cuotas_atrasadas
    @proyectos = Array.new
    aux = CuotaPorCliente.getAtrasadas.map {|e| e.proyecto_id}
    aux = aux.uniq
    aux.each do |i|
      p = Proyecto.find(i)
      @proyectos << p
    end

    respond_to do |format|
      format.html { render "proyectos_con_cuotas_atrasadas.html.slim"}
      #format.json { render json: @productos }
    end
  end

  def estadisticas
    @proyecto = Proyecto.find(params[:id])

    respond_to do |format|
      format.html { render 'estadistica.html.slim' }
      format.json { render json: @proyecto }
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "Proyecto"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(:codigo, :nombre, :descripcion, :calle, :nroDomicilio, :piso, :dpto, :telefono, :email, :pagWeb, {:persona_ids => []}, :etapa_id, :pais_id, :provincia_id, :ciudad_id, :area_id)
      #{:persona_ids => []}
    end
end
