class Pago < ActiveRecord::Base

  belongs_to :tipo_de_pago
  belongs_to :proyecto
  belongs_to :persona
  belongs_to :cuenta

  has_many :pagos_metodos, dependent: :destroy
  has_many :tipos_de_pago, :through => :pagos_metodos

  accepts_nested_attributes_for :pagos_metodos, :allow_destroy => true
  
  has_many :cuotas_por_cliente, inverse_of: :pago
  accepts_nested_attributes_for :cuotas_por_cliente, reject_if: :validate_descuentos, :update_only => true

  validates :cuota_por_cliente_ids, :presence => {:message => "No ha seleccionado ninguna cuota."}, :allow_blank => false
  validates :persona_id, :presence => true
  validates :fecha, :presence => true
  validates :cuenta_id, :presence => true
  
  validates_presence_of :pagos_metodos
  validates_associated :pagos_metodos
  #validates_with CantidadAPagarValidator, on: :create

  before_validation :set_today
  
  before_create :setear_monto

  after_create :actualizar_estados
  


  def set_today 
    self.fecha = Date.today
  end

  def setear_monto
    if self.new_record?
      monto_a_pagar = 0
      self.cuotas_por_cliente.each do |cuota|
        if cuota.has_descuento?
          cuota.montoTotal = cuota.montoTotal * (1 - (cuota.descuento.porcentaje/100))
        end
        monto_a_pagar = monto_a_pagar + cuota.montoTotal
      end
      self.monto = monto_a_pagar
    end  
    setear_monto_de_acuerdo_a_saldo()
  end

  def actualizar_estados
    self.transaction do
      self.cuotas_por_cliente.each do |cuota|
        cuota.update( estado: true, pago: self )
      end

      if cuenta.changed?
        cuenta.save!
      end
    end
  end

  def setear_monto_de_acuerdo_a_saldo
    montoAcreditado = 0
    self.pagos_metodos.each {|pm| montoAcreditado += pm.monto }
    
    if cuenta.saldo > 0
      if cuenta.saldo > self.monto
        cuenta.saldo = cuenta.saldo - self.monto
        self.monto = 0
      else
        self.monto = self.monto - cuenta.saldo
      end
      if montoAcreditado > self.monto
        cuenta.saldo = (montoAcreditado - self.monto)
      end
    elsif cuenta.saldo == 0
      if montoAcreditado > self.monto
        cuenta.saldo = (montoAcreditado - self.monto)
      end
    end
  end

  def update_descuentos_cuotas(cuotas_descuento_param)
    cuotas_por_cliente.each do |cuota|
      c = cuotas_descuento_param.select {|c| c['id'].to_i == cuota.id }[0]
      cuota.descuento_id = c['descuento_id']
    end
  end

  HUMANIZED_ATTRIBUTES = {
    :cuota_por_cliente_ids => "Cuotas: ",
    :proyecto_id => "Proyecto: ",
    :persona_id => "Responsable: ",
    :"pagos_metodos.monto" => "Metodo de Pago [Monto]: ",
    :"pagos_metodos.tipo_de_pago_id" => "Metodo de Pago [Tipo de Pago]: ",
    :pagos_metodos => "Metodo de Pago: "
  }

  def self.human_attribute_name(*args)
    puts "self.human_attribute_name"
    puts "[args[0]]", args[0]
    HUMANIZED_ATTRIBUTES[args[0]] || super
  end

  protected

    def validate_descuentos(cuota_attr)
      cuota_por_cliente_ids.include? cuota_attr['id'].to_i
    end
end
