class AccionesController < ApplicationController
  before_action :set_accion, only: [:show, :edit, :update, :destroy]

  # GET /acciones
  # GET /acciones.json
  def index
    @acciones = Accion.all
  end

  # GET /acciones/1
  # GET /acciones/1.json
  def show
  end

  # GET /acciones/new
  def new
    @accion = Accion.new
  end

  # GET /acciones/1/edit
  def edit
  end

  # POST /acciones
  # POST /acciones.json
  def create
    @accion = Accion.new(accion_params)

    respond_to do |format|
      if @accion.save
        format.html { redirect_to @accion, notice: 'Accion was successfully created.' }
        format.json { render :show, status: :created, location: @accion }
      else
        format.html { render :new }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acciones/1
  # PATCH/PUT /acciones/1.json
  def update
    respond_to do |format|
      if @accion.update(accion_params)
        format.html { redirect_to @accion, notice: 'Accion was successfully updated.' }
        format.json { render :show, status: :ok, location: @accion }
      else
        format.html { render :edit }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acciones/1
  # DELETE /acciones/1.json
  def destroy
    @accion.destroy
    respond_to do |format|
      format.html { redirect_to acciones_url, notice: 'Accion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accion
      @accion = Accion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accion_params
      params.require(:accion).permit(:nombre, :key_name, :modelo_ids => [])
    end
end
