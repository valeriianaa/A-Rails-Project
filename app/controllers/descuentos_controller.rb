class DescuentosController < ApplicationController
  before_action :set_descuento, only: [:show, :edit, :update, :destroy]

  # GET /descuentos
  # GET /descuentos.json
  def index
    @descuentos = Descuento.all
    @usuario = current_user
    respond_to do |format|
      format.html
      format.pdf do
        pdf = DescuentosPdf.new(@descuentos, @usuario)
        send_data pdf.render, filename: "descuentos#{@descuentos}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
  end

  # GET /descuentos/1
  # GET /descuentos/1.json
  def show
  end

  # GET /descuentos/new
  def new
    @descuento = Descuento.new
  end

  # GET /descuentos/1/edit
  def edit
  end

  # POST /descuentos
  # POST /descuentos.json
  def create
    @descuento = Descuento.new(descuento_params)

    respond_to do |format|
      if @descuento.save
        format.html { redirect_to @descuento, notice: 'Descuento fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @descuento }
      else
        format.html { render :new }
        format.json { render json: @descuento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /descuentos/1
  # PATCH/PUT /descuentos/1.json
  def update
    respond_to do |format|
      if @descuento.update(descuento_params)
        format.html { redirect_to @descuento, notice: 'Descuento fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @descuento }
      else
        format.html { render :edit }
        format.json { render json: @descuento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descuentos/1
  # DELETE /descuentos/1.json
  def destroy
    respond_to do |format|
      if @descuento.destroy
        format.html { redirect_to descuentos_url, notice: 'Descuento fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'El Descuento no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "Descuento"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_descuento
      @descuento = Descuento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def descuento_params
      params.require(:descuento).permit(:nombre, :descripcion, :porcentaje)
    end
end
