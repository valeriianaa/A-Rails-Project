class ModelosController < ApplicationController
  before_action :set_modelo, only: [:show, :edit, :update, :destroy]

  # GET /modelos
  # GET /modelos.json
  def index
    @modelos = Modelo.all
  end

  # GET /modelos/1
  # GET /modelos/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ModeloPdf.new(@modelo)
        send_data pdf.render, filename: "modelo_#{@modelo.id}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /modelos/new
  def new
    @modelo = Modelo.new
  end

  # GET /modelos/1/edit
  def edit
  end

  # POST /modelos
  # POST /modelos.json
  def create
    @modelo = Modelo.new(modelo_params)

    respond_to do |format|
      if @modelo.save
        format.html { redirect_to @modelo, notice: 'Modelo fue creado exitosamente' }
        format.json { render :show, status: :created, location: @modelo }
      else
        format.html { render :new }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modelos/1
  # PATCH/PUT /modelos/1.json
  def update
    respond_to do |format|
      if @modelo.update(modelo_params)
        format.html { redirect_to @modelo, notice: 'Modelo fue actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @modelo }
      else
        format.html { render :edit }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelos/1
  # DELETE /modelos/1.json
  def destroy
    respond_to do |format|
      if @modelo.destroy
        format.html { redirect_to modelos_url, notice: 'Modelo fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'El Modelo no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelo
      @modelo = Modelo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modelo_params
      params.require(:modelo).permit(:nombre, :accion_ids => [])
    end
end
