class RolesDeEmpleadosController < ApplicationController
  before_action :set_rol_de_empleado, only: [:show, :edit, :update, :destroy]

  # GET /roles_de_empleados
  # GET /roles_de_empleados.json
  def index
    @roles_de_empleados = RolDeEmpleado.all
    @usuario = current_user
    respond_to do |format|
      format.html
      format.pdf do
        pdf = RolesDeEmpleadosPdf.new(@roles_de_empleados, @usuario)
        send_data pdf.render, filename: "roles_de_empleados#{@roles_de_empleados}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
  end

  # GET /roles_de_empleados/1
  # GET /roles_de_empleados/1.json
  def show
  end

  # GET /roles_de_empleados/new
  def new
    @rol_de_empleado = RolDeEmpleado.new
  end

  # GET /roles_de_empleados/1/edit
  def edit
  end

  # POST /roles_de_empleados
  # POST /roles_de_empleados.json
  def create
    @rol_de_empleado = RolDeEmpleado.new(rol_de_empleado_params)

    respond_to do |format|
      if @rol_de_empleado.save
        format.html { redirect_to @rol_de_empleado, notice: 'Rol de empleado due creado exitosamente.' }
        format.json { render :show, status: :created, location: @rol_de_empleado }
      else
        format.html { render :new }
        format.json { render json: @rol_de_empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles_de_empleados/1
  # PATCH/PUT /roles_de_empleados/1.json
  def update
    respond_to do |format|
      if @rol_de_empleado.update(rol_de_empleado_params)
        format.html { redirect_to @rol_de_empleado, notice: 'Rol de empleado fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @rol_de_empleado }
      else
        format.html { render :edit }
        format.json { render json: @rol_de_empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles_de_empleados/1
  # DELETE /roles_de_empleados/1.json
  def destroy
    respond_to do |format|
      if @rol_de_empleado.destroy
        format.html { redirect_to roles_de_empleados_url, notice: 'Rol de empleado fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'Rol de empleado no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "RolDeEmpleado"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol_de_empleado
      @rol_de_empleado = RolDeEmpleado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rol_de_empleado_params
      params.require(:rol_de_empleado).permit(:nombre, :departamento_id)
    end
end
