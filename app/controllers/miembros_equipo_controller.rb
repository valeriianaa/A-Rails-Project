class MiembrosEquipoController < ApplicationController
  before_action :set_miembro_equipo, only: [:show, :edit, :update, :destroy]

  # GET /miembros_equipo
  # GET /miembros_equipo.json
  def index
    @miembros_equipo = MiembroEquipo.all
    respond_to do |format|
      format.html
      #format.csv { send_data @miembros_equipo.to_csv, filename: "miembros_equipo-#{Date.today}.csv" }
      format.xls
    end
  end

  # GET /miembros_equipo/1
  # GET /miembros_equipo/1.json
  def show
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
        format.html { redirect_to @miembro_equipo, notice: 'Miembro equipo was successfully created.' }
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
        format.html { redirect_to @miembro_equipo, notice: 'Miembro equipo was successfully updated.' }
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
    @miembro_equipo.destroy
    respond_to do |format|
      format.html { redirect_to miembros_equipo_url, notice: 'Miembro equipo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miembro_equipo
      @miembro_equipo = MiembroEquipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miembro_equipo_params
      params.require(:miembro_equipo).permit(:nombre, :apellido, :nroIdentificacion, :fechaNacimiento, :calle, :nroDomicilio, :piso, :dpto, :telefono, :email, :type, :pais_id, :provincia_id, :ciudad_id, :area_id, :tipo_documento_id, :proyecto_id)
      #params.fetch(:miembro_equipo, {})
    end
end
