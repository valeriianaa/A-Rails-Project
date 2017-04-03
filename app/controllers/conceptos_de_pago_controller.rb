class ConceptosDePagoController < ApplicationController
  before_action :set_concepto_de_pago, only: [:show, :edit, :update, :destroy]

  # GET /conceptos_de_pago
  # GET /conceptos_de_pago.json
  def index
    @conceptos_de_pago = ConceptoDePago.all
    @usuario = current_user
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ConceptosDePagoPdf.new(@conceptos_de_pago, @usuario)
        send_data pdf.render, filename: "conceptos_de_pago#{@conceptos_de_pago}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
  end

  # GET /conceptos_de_pago/1
  # GET /conceptos_de_pago/1.json
  def show
  end

  # GET /conceptos_de_pago/new
  def new
    @concepto_de_pago = ConceptoDePago.new
    @concepto_de_pago.vencimientos.build
  end

  # GET /conceptos_de_pago/1/edit
  def edit
  end

  # POST /conceptos_de_pago
  # POST /conceptos_de_pago.json
  def create
    @concepto_de_pago = ConceptoDePago.new(concepto_de_pago_params)
    #@plazo = @concepto_de_pago.diferencia 
    # @concepto_de_pago.plazoRecordatorio = Chronic.parse(@concepto_de_pago.diferencia, :now => @concepto_de_pago.fechaVencimiento)

    respond_to do |format|
      if @concepto_de_pago.save
        format.html { redirect_to @concepto_de_pago, notice: 'Concepto de pago fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @concepto_de_pago }
      else
        format.html { render :new }
        format.json { render json: @concepto_de_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conceptos_de_pago/1
  # PATCH/PUT /conceptos_de_pago/1.json
  def update
    respond_to do |format|
      if @concepto_de_pago.update(concepto_de_pago_params)
        format.html { redirect_to @concepto_de_pago, notice: 'Concepto de pago fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @concepto_de_pago }
      else
        format.html { render :edit }
        format.json { render json: @concepto_de_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conceptos_de_pago/1
  # DELETE /conceptos_de_pago/1.json
  def destroy
    respond_to do |format|
      if @concepto_de_pago.destroy
        format.html { redirect_to conceptos_de_pago_url, notice: 'Concepto de pago fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'El Concepto de pago no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "ConceptoDePago"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concepto_de_pago
      @concepto_de_pago = ConceptoDePago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concepto_de_pago_params
      params.require(:concepto_de_pago).permit(
        :codigo,
        :nombre, 
        :descripcion, 
        :monto, 
        :fechaInicioDePago, 
        :fechaVencimiento, 
        :plazoRecordatorio, 
        :diferencia, 
        :vencimientos_attributes => [ :id, :fecha, :concepto_de_pago_id, :interes_id, :_destroy ])
    end
end
