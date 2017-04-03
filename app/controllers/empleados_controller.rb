class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :edit, :update, :destroy]

  # GET /empleados
  # GET /empleados.json
  def index
    @empleados = Empleado.all
    @usuario = current_user
    respond_to do |format|
      format.html
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
      format.pdf do
        pdf = EmpleadosPdf.new(@empleados, @usuario)
        send_data pdf.render, filename: "empleados#{@empleados}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /empleados/1
  # GET /empleados/1.json
  def show
    @usuario = current_user
    respond_to do |format|
      format.html
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
      format.pdf do
        pdf = EmpleadoPdf.new(@empleado, @usuario)
        send_data pdf.render, filename: "empleado#{@empleado}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /empleados/new
  def new
    @empleado = Empleado.new
  end

  # GET /empleados/1/edit
  def edit
  end

  # POST /empleados
  # POST /empleados.json
  def create
    @empleado = Empleado.new(empleado_params)

    respond_to do |format|
      if @empleado.save
        format.html { redirect_to @empleado, notice: 'Empleado fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @empleado }
      else
        format.html { render :new }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empleados/1
  # PATCH/PUT /empleados/1.json
  def update
    respond_to do |format|
      if @empleado.update(empleado_params)
        format.html { redirect_to @empleado, notice: 'Empleado fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @empleado }
      else
        format.html { render :edit }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empleados/1
  # DELETE /empleados/1.json
  def destroy
    respond_to do |format|
      if @empleado.destroy
        format.html { redirect_to empleados_url, notice: 'Empleado fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'El Empleado no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = Array.new
    Empleado.all.each do |empleado|
      empleado.audits.each do |a|
        @auditoria << a
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empleado
      @empleado = Empleado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empleado_params
      params.require(:empleado).permit(:codigo, :nombre, :apellido, :nroIdentificacion, :fechaNacimiento, :calle, :nroDomicilio, :piso, :dpto, :telefono, :email, :type, :pais_id, :provincia_id, :ciudad_id, :area_id, :tipo_documento_id, :departamento_id, :rol_de_empleado_id)
      #params.fetch(:empleado, {})
    end

    def breadcrum
      add_breadcrumb 'Empleados', empleados_path
    end
end
