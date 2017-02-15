class VencimientosController < ApplicationController
  before_action :set_vencimiento, only: [:show, :edit, :update, :destroy]

  # GET /vencimientos
  # GET /vencimientos.json
  def index
    @vencimientos = Vencimiento.all
  end

  # GET /vencimientos/1
  # GET /vencimientos/1.json
  def show
  end

  # GET /vencimientos/new
  def new
    @vencimiento = Vencimiento.new
  end

  # GET /vencimientos/1/edit
  def edit
  end

  # POST /vencimientos
  # POST /vencimientos.json
  def create
    @vencimiento = Vencimiento.new(vencimiento_params)

    respond_to do |format|
      if @vencimiento.save
        format.html { redirect_to @vencimiento, notice: 'Vencimiento was successfully created.' }
        format.json { render :show, status: :created, location: @vencimiento }
      else
        format.html { render :new }
        format.json { render json: @vencimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vencimientos/1
  # PATCH/PUT /vencimientos/1.json
  def update
    respond_to do |format|
      if @vencimiento.update(vencimiento_params)
        format.html { redirect_to @vencimiento, notice: 'Vencimiento was successfully updated.' }
        format.json { render :show, status: :ok, location: @vencimiento }
      else
        format.html { render :edit }
        format.json { render json: @vencimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vencimientos/1
  # DELETE /vencimientos/1.json
  def destroy
    @vencimiento.destroy
    respond_to do |format|
      format.html { redirect_to vencimientos_url, notice: 'Vencimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vencimiento
      @vencimiento = Vencimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vencimiento_params
      params.require(:vencimiento).permit(:fecha, :concepto_de_pago_id, :interes_id)
    end
end
