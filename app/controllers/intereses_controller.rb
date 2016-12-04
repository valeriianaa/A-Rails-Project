class InteresesController < ApplicationController
  before_action :set_interes, only: [:show, :edit, :update, :destroy]

  # GET /intereses
  # GET /intereses.json
  def index
    @intereses = Interes.all
  end

  # GET /intereses/1
  # GET /intereses/1.json
  def show
  end

  # GET /intereses/new
  def new
    @interes = Interes.new
  end

  # GET /intereses/1/edit
  def edit
  end

  # POST /intereses
  # POST /intereses.json
  def create
    @interes = Interes.new(interes_params)

    respond_to do |format|
      if @interes.save
        format.html { redirect_to @interes, notice: 'Interes was successfully created.' }
        format.json { render :show, status: :created, location: @interes }
      else
        format.html { render :new }
        format.json { render json: @interes.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intereses/1
  # PATCH/PUT /intereses/1.json
  def update
    respond_to do |format|
      if @interes.update(interes_params)
        format.html { redirect_to @interes, notice: 'Interes was successfully updated.' }
        format.json { render :show, status: :ok, location: @interes }
      else
        format.html { render :edit }
        format.json { render json: @interes.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intereses/1
  # DELETE /intereses/1.json
  def destroy
    @interes.destroy
    respond_to do |format|
      format.html { redirect_to intereses_url, notice: 'Interes was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interes
      @interes = Interes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interes_params
      params.require(:interes).permit(:nombre, :descripcion, :porcentaje)
    end
end
