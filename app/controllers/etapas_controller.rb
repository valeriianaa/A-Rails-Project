class EtapasController < ApplicationController
  before_action :set_etapa, only: [:show, :edit, :update, :destroy]

  # GET /etapas
  # GET /etapas.json
  def index
    @etapas = Etapa.all
    respond_to do |format|
      format.html
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
      format.pdf do
        pdf = EtapasPdf.new(@etapas)
        send_data pdf.render, filename: "etapas#{@etapas}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /etapas/1
  # GET /etapas/1.json
  def show
    respond_to do |format|
      format.html
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
      format.pdf do
        pdf = EtapaPdf.new(@etapa)
        send_data pdf.render, filename: "etapa#{@etapa}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /etapas/new
  def new
    @etapa = Etapa.new
  end

  # GET /etapas/1/edit
  def edit
  end

  # POST /etapas
  # POST /etapas.json
  def create
    @etapa = Etapa.new(etapa_params)

    respond_to do |format|
      if @etapa.save
        format.html { redirect_to @etapa, notice: 'Etapa fue creada exitosamente.' }
        format.json { render :show, status: :created, location: @etapa }
      else
        format.html { render :new }
        format.json { render json: @etapa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etapas/1
  # PATCH/PUT /etapas/1.json
  def update
    respond_to do |format|
      if @etapa.update(etapa_params)
        format.html { redirect_to @etapa, notice: 'Etapa fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @etapa }
      else
        format.html { render :edit }
        format.json { render json: @etapa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etapas/1
  # DELETE /etapas/1.json
  def destroy
    respond_to do |format|
      if @estado.destroy
        format.html { redirect_to estados_url, notice: 'Etapa fue eliminada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'La Etapa no pudo ser eliminada.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "Etapa"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etapa
      @etapa = Etapa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etapa_params
      params.require(:etapa).permit(:nombre, :descripcion, :etapaAnterior)
    end
end
