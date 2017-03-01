class SystemsettingsController < ApplicationController
  before_action :set_systemsetting, only: [:show, :edit, :update, :destroy]

  # GET /systemsettings
  # GET /systemsettings.json
  def index
    @systemsettings = Systemsetting.all
  end

  # GET /systemsettings/1
  # GET /systemsettings/1.json
  def show
  end

  # GET /systemsettings/new
  def new
    @systemsetting = Systemsetting.new
  end

  # GET /systemsettings/1/edit
  def edit
  end

  # POST /systemsettings
  # POST /systemsettings.json
  def create
    @systemsetting = Systemsetting.new(systemsetting_params)

    respond_to do |format|
      if @systemsetting.save
        format.html { redirect_to root_path, notice: 'Se Creó la Configuración Correctamente.' }
      else
        format.html { render :new }
        format.json { render json: @systemsetting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /systemsettings/1
  # PATCH/PUT /systemsettings/1.json
  def update
    respond_to do |format|
      if @systemsetting.update(systemsetting_params)
        format.html { redirect_to edit_systemsetting_path(@systemsetting), notice: 'Se Actualizo la Configuracion Correctamente.' }
      else
        format.html { render :edit }
        format.json { render json: @systemsetting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /systemsettings/1
  # DELETE /systemsettings/1.json
  def destroy
    @systemsetting.destroy
    respond_to do |format|
      format.html { redirect_to systemsettings_url, notice: 'Systemsetting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_systemsetting
      @systemsetting = Systemsetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def systemsetting_params
      params.require(:systemsetting).permit(:tipo_de_pago_id, :numero_abandono, :tiempo_abandono)
    end
end
