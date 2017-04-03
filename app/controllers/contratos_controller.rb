class ContratosController < ApplicationController
  before_action :set_contrato, only: [:show, :edit, :update, :destroy]

  # GET /contratos
  # GET /contratos.json
  def index
    @contratos = Contrato.all
    @usuario = current_user
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ContratosPdf.new(@contratos, @usuario)
        send_data pdf.render, filename: "contratos#{@contratos}.pdf", type: "application/pdf", disposition: "inline"
      end
      format.xls
    end
  end

  # GET /contratos/1
  # GET /contratos/1.json
  def show
  end

  # GET /contratos/new
  def new
    @contrato = Contrato.new
  end

  # GET /contratos/1/edit
  def edit
  end

  # POST /contratos
  # POST /contratos.json
  def create
    @contrato = Contrato.new(contrato_params)

    respond_to do |format|
      if @contrato.save
        @contrato.anadir_conceptosdepago(@contrato.fecha_inicio, @contrato.fecha_fin)
        format.html { redirect_to @contrato, notice: 'Contrato fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @contrato }
      else
        format.html { render :new }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contratos/1
  # PATCH/PUT /contratos/1.json
  def update
    f_inicio_vieja = @contrato.fecha_inicio
    f_fin_vieja = @contrato.fecha_fin
    respond_to do |format|
      if @contrato.update(contrato_params)
        f_inicio_nueva = @contrato.fecha_inicio
        f_fin_nueva = @contrato.fecha_fin
        if f_inicio_nueva < f_inicio_vieja
          @contrato.anadir_conceptosdepago(f_inicio_nueva, f_inicio_vieja)
        elsif f_fin_nueva > f_fin_vieja
          @contrato.anadir_conceptosdepago(f_fin_vieja, f_fin_nueva)
        end
        format.html { redirect_to @contrato, notice: 'Contrato fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @contrato }
      else
        format.html { render :edit }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contratos/1
  # DELETE /contratos/1.json
  def destroy
    respond_to do |format|
      if @contrato.destroy
        format.html { redirect_to contratos_url, notice: 'Contrato fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :show, notice: 'El Contrato no pudo ser eliminado.' }
        format.json { head :no_content }
      end
    end
  end

  def audited
    audited = Audited::Adapters::ActiveRecord::Audit
    @auditoria = audited.where auditable_type: "Contrato"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contrato
      @contrato = Contrato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contrato_params
      params.require(:contrato).permit(:fecha_inicio, :fecha_fin, :proyecto_id, :persona_id)
    end
end
