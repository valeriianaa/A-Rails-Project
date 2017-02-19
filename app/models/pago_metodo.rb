class PagoMetodo < ActiveRecord::Base
  belongs_to :pago
  belongs_to :tipo_de_pago

  validates :monto, :presence => true, :allow_blank => false
  validates :monto, :numericality => true
  validates :tipo_de_pago_id, :presence => true

  # validates_presence_of :pago
  HUMANIZED_ATTRIBUTES = {
    :monto => "Monto: ",
    :tipo_de_pago_id => "Tipo de Pago: "
  }

  def self.human_attribute_name(*args)
    HUMANIZED_ATTRIBUTES[args[0]] || super
  end
end
