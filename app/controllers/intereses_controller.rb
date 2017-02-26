class InteresesController < ApplicationController
  before_action :set_interes, only: [:show, :edit, :update, :destroy]

  # GET /intereses
  # GET /intereses.json
  def index
    @intereses = Interes.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InteresesPdf.new(@intereses)
        send_data pdf.render, filename: "intereses#{@intereses}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
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
        format.html { redirect_to @interes, notice: 'Interes fue creado exitosamente.' }
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
        format.html { redirect_to @interes, notice: 'Interes fue actualizado exitosamente.' }
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
    respond_to do |format|
      if @descuento.destroy
        format.html { redirect_to descuentos_url, notice: 'Interés fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'Interés no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "Interes"
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
