class EspecialidadesDeContactoController < ApplicationController
  before_action :set_especialidad_de_contacto, only: [:show, :edit, :update, :destroy]

  # GET /especialidades_de_contacto
  # GET /especialidades_de_contacto.json
  def index
    @especialidades_de_contacto = EspecialidadDeContacto.all
    @usuario = current_user
    respond_to do |format|
      format.html
      format.pdf do
        pdf = EspecialidadesDeContactoPdf.new(@especialidades_de_contacto, @usuario)
        send_data pdf.render, filename: "especialidades_de_contacto#{@especialidades_de_contacto}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
  end

  # GET /especialidades_de_contacto/1
  # GET /especialidades_de_contacto/1.json
  def show
  end

  # GET /especialidades_de_contacto/new
  def new
    @especialidad_de_contacto = EspecialidadDeContacto.new
  end

  # GET /especialidades_de_contacto/1/edit
  def edit
  end

  # POST /especialidades_de_contacto
  # POST /especialidades_de_contacto.json
  def create
    @especialidad_de_contacto = EspecialidadDeContacto.new(especialidad_de_contacto_params)

    respond_to do |format|
      if @especialidad_de_contacto.save
        format.html { redirect_to @especialidad_de_contacto, notice: 'Especialidad de contacto fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @especialidad_de_contacto }
      else
        format.html { render :new }
        format.json { render json: @especialidad_de_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /especialidades_de_contacto/1
  # PATCH/PUT /especialidades_de_contacto/1.json
  def update
    respond_to do |format|
      if @especialidad_de_contacto.update(especialidad_de_contacto_params)
        format.html { redirect_to @especialidad_de_contacto, notice: 'Especialidad de contacto fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @especialidad_de_contacto }
      else
        format.html { render :edit }
        format.json { render json: @especialidad_de_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /especialidades_de_contacto/1
  # DELETE /especialidades_de_contacto/1.json
  def destroy
    respond_to do |format|
      if @especialidad_de_contacto.destroy
        format.html { redirect_to especialidades_de_contacto_url, notice: 'Especialidad de contacto fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'Especialidad de contacto no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "EspecialidadDeContacto"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_especialidad_de_contacto
      @especialidad_de_contacto = EspecialidadDeContacto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def especialidad_de_contacto_params
      params.require(:especialidad_de_contacto).permit(:nombre, :descripcion)
    end
end
