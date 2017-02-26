class TiposDePagoController < ApplicationController
  before_action :set_tipo_de_pago, only: [:show, :edit, :update, :destroy]

  # GET /tipos_de_pago
  # GET /tipos_de_pago.json
  def index
    @tipos_de_pago = TipoDePago.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = TiposDePagoPdf.new(@tipos_de_pago)
        send_data pdf.render, filename: "tipos_de_pago#{@tipos_de_pago}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
  end

  # GET /tipos_de_pago/1
  # GET /tipos_de_pago/1.json
  def show
  end

  # GET /tipos_de_pago/new
  def new
    @tipo_de_pago = TipoDePago.new
  end

  # GET /tipos_de_pago/1/edit
  def edit
  end

  # POST /tipos_de_pago
  # POST /tipos_de_pago.json
  def create
    @tipo_de_pago = TipoDePago.new(tipo_de_pago_params)

    respond_to do |format|
      if @tipo_de_pago.save
        format.html { redirect_to @tipo_de_pago, notice: 'Tipo de pago fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_de_pago }
      else
        format.html { render :new }
        format.json { render json: @tipo_de_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos_de_pago/1
  # PATCH/PUT /tipos_de_pago/1.json
  def update
    respond_to do |format|
      if @tipo_de_pago.update(tipo_de_pago_params)
        format.html { redirect_to @tipo_de_pago, notice: 'Tipo de pago fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_de_pago }
      else
        format.html { render :edit }
        format.json { render json: @tipo_de_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_de_pago/1
  # DELETE /tipos_de_pago/1.json
  def destroy
    respond_to do |format|
      if @tipo_de_pago.destroy
        format.html { redirect_to tipos_de_pago_url, notice: 'Tipo de pago fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'Tipo de pago no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "TipoDePago"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_de_pago
      @tipo_de_pago = TipoDePago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_de_pago_params
      params.require(:tipo_de_pago).permit(:nombre)
    end
end
