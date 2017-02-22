class Configuracion < ActiveRecord::Base
	#mount_uploader :logo, LogotipoUploader
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area

	validates :logo, :nombre, :cuit, :condicion_iva, :presence => true
	validates :pais_id, :provincia_id, :ciudad_id, :area_id, :presence => true
	validates :cuit, :uniqueness => true
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
