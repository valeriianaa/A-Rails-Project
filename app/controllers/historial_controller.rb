class HistorialesController < ApplicationController
	before_action :set_departamento, only: [:show, :edit, :update, :destroy]

  # GET /departamentos
  # GET /departamentos.json
  def index
    @historials = Historial.all
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
  end

  # GET /departamentos/new
  def new
    @historial = Historial.new
  end

  # GET /departamentos/1/edit
  def edit
  end

  # POST /departamentos
  # POST /departamentos.json
  def create
    @historial = Historial.new(historial_params)
    @historial.save
    # respond_to do |format|
    #   if @historial.save
    #     format.html { redirect_to @historial, notice: 'Historial was successfully created.' }
    #     format.json { render :show, status: :created, location: @historial }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @historial.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /departamentos/1
  # PATCH/PUT /departamentos/1.json
  def update
    # respond_to do |format|
    #   if @historial.update(historial_params)
    #     format.html { redirect_to @historial, notice: 'Historial was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @historial }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @historial.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    # @historial.destroy
    # respond_to do |format|
    #   format.html { redirect_to historials_url, notice: 'Historial was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial
      @historial = Historial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_params
      params.require(:historial).permit(:fechaHora, :estado_id, :user_id, :actividad_proyecto_id)
    end
end
