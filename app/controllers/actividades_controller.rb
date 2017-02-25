class ActividadesController < ApplicationController
  before_action :set_actividad, only: [:show, :edit, :update, :destroy]

  # GET /actividades
  # GET /actividades.json
  def index
    @actividades = Actividad.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ActividadesPdf.new(@actividades)
        send_data pdf.render, filename: "actividades#{@actividades}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
  end

  # GET /actividades/1
  # GET /actividades/1.json
  def show
  end

  # GET /actividades/new
  def new
    @actividad = Actividad.new
  end

  # GET /actividades/1/edit
  def edit
  end

  # POST /actividades
  # POST /actividades.json
  def create
    @actividad = Actividad.new(actividad_params)

    respond_to do |format|
      if @actividad.save
        format.html { redirect_to @actividad, notice: 'Actividad fue creada exitosamente.' }
        format.json { render :show, status: :created, location: @actividad }
      else
        format.html { render :new }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividades/1
  # PATCH/PUT /actividades/1.json
  def update
    respond_to do |format|
      if @actividad.update(actividad_params)
        format.html { redirect_to @actividad, notice: 'Actividad fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @actividad }
      else
        format.html { render :edit }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividades/1
  # DELETE /actividades/1.json
  # def destroy
  #   @actividad.destroy
  #   respond_to do |format|
  #     format.html { redirect_to actividades_url, notice: 'Actividad fue destruida exitosamente.' }
  #     format.json { head :no_content }
  #   end
  # end

  def destroy
    respond_to do |format|
      if @actividad.destroy
        format.html { redirect_to actividades_url, notice: 'Actividad fue eliminada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'La Actividad no pudo ser eliminada.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "Actividad"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividad
      @actividad = Actividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividad_params
      params.require(:actividad).permit(:nombre, :descripcion, :obligatorio, :etapa_id, :actividades_antecedentes => [])
    end
end
