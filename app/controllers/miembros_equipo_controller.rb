class MiembrosEquipoController < ApplicationController
  before_action :set_miembro_equipo, only: [:show, :edit, :update, :destroy]

  # GET /miembros_equipo
  # GET /miembros_equipo.json
  def index
    @miembros_equipo = MiembroEquipo.all
    @usuario = current_user
    respond_to do |format|
      format.html
      format.pdf do
        pdf = MiembrosEquipoPdf.new(@miembros_equipo, @usuario)
        send_data pdf.render, filename: "miembros_equipo#{@miembros_equipo}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
  end

  # GET /miembros_equipo/1
  # GET /miembros_equipo/1.json
  def show
    @usuario = current_user
    respond_to do |format|
      format.html
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
      format.pdf do
        pdf = MiembroEquipoPdf.new(@miembro_equipo, @usuario)
        send_data pdf.render, filename: "miembro_equipo#{@miembro_equipo}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /miembros_equipo/new
  def new
    @miembro_equipo = MiembroEquipo.new
  end

  # GET /miembros_equipo/1/edit
  def edit
  end

  # POST /miembros_equipo
  # POST /miembros_equipo.json
  def create
    @miembro_equipo = MiembroEquipo.new(miembro_equipo_params)

    respond_to do |format|
      if @miembro_equipo.save
        format.html { redirect_to @miembro_equipo, notice: 'Miembro equipo fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @miembro_equipo }
      else
        format.html { render :new }
        format.json { render json: @miembro_equipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miembros_equipo/1
  # PATCH/PUT /miembros_equipo/1.json
  def update
    respond_to do |format|
      if @miembro_equipo.update(miembro_equipo_params)
        format.html { redirect_to @miembro_equipo, notice: 'Miembro equipo fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @miembro_equipo }
      else
        format.html { render :edit }
        format.json { render json: @miembro_equipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miembros_equipo/1
  # DELETE /miembros_equipo/1.json
 def destroy
    respond_to do |format|
      if @miembro_equipo.destroy
        format.html { redirect_to miembros_equipo_url, notice: 'Miembro de Equipo fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'Miembro de Equipo no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  def audited

    audited = Audited::Adapters::ActiveRecord::Audit
    auditoria_aux = audited.where auditable_type: "Persona"
    @auditoria = Array.new
    auditoria_aux.each do |audit|
      if audit.action == "update"
        if audit.comment == "MiembroEquipo"
          @auditoria << audit
        end
      else
        if audit.audited_changes["tipo"] == "MiembroEquipo"
          @auditoria << audit
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miembro_equipo
      @miembro_equipo = MiembroEquipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miembro_equipo_params
      params.require(:miembro_equipo).permit(:codigo, :nombre, :apellido, :nroIdentificacion, :fechaNacimiento, :calle, :nroDomicilio, :piso, :dpto, :telefono, :email, :type, :pais_id, :provincia_id, :ciudad_id, :area_id, :tipo_documento_id, :proyecto_id, :tipo, :audit_comment)
      #params.fetch(:miembro_equipo, {})
    end
end
