class ContactosController < ApplicationController
  before_action :set_contacto, only: [:show, :edit, :update, :destroy]

  # GET /contactos
  # GET /contactos.json
  def index
    @contactos = Contacto.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ContactosPdf.new(@contactos)
        send_data pdf.render, filename: "contactos#{@contactos}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
  end

  # GET /contactos/1
  # GET /contactos/1.json
  def show
  end

  # GET /contactos/new
  def new
    @contacto = Contacto.new
  end

  # GET /contactos/1/edit
  def edit
  end

  # POST /contactos
  # POST /contactos.json
  def create
    @contacto = Contacto.new(contacto_params)

    respond_to do |format|
      if @contacto.save
        format.html { redirect_to @contacto, notice: 'Contacto fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @contacto }
      else
        format.html { render :new }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contactos/1
  # PATCH/PUT /contactos/1.json
  def update
    respond_to do |format|
      if @contacto.update(contacto_params)
        format.html { redirect_to @contacto, notice: 'Contacto fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @contacto }
      else
        format.html { render :edit }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contactos/1
  # DELETE /contactos/1.json
  def destroy
    respond_to do |format|
      if @contacto.destroy
        format.html { redirect_to contactos_url, notice: 'Contacto fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'El Contacto no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "Contacto"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contacto
      @contacto = Contacto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contacto_params
      params.require(:contacto).permit(:codigo, :nombre, :apellido, :nroIdentificacion, :fechaNacimiento, :calle, :nroDomicilio, :piso, :dpto, :telefono, :email, :type, :pais_id, :provincia_id, :ciudad_id, :area_id, :tipo_documento_id, :especialidad_de_contacto_id)
      #params.fetch(:contacto, {})
    end
end
