class Systemsetting < ActiveRecord::Base
  belongs_to :tipo_de_pago

  validates :numero_abandono, numericality: { greater_than: 0 }
  validates :numero_abandono, :presence => true, if: :tiempo_abandono?
  validates :tiempo_abandono, :presence => true, if: :numero_abandono?

  def numero_tiempo
  	if self.tiempo_abandono == "days"
  		return (self.numero_abandono).days
  	elsif self.tiempo_abandono == "weeks"
  		return (self.numero_abandono).weeks
  	elsif self.tiempo_abandono == "months"
  		return (self.numero_abandono).months
  	elsif self.tiempo_abandono == "years"
  		return (self.numero_abandono).years
  	elsif self.tiempo_abandono == "minutes"
  		return (self.numero_abandono).minutes
  	elsif self.tiempo_abandono == "hours"
  		return (self.numero_abandono).hours
  	end
  end
end
