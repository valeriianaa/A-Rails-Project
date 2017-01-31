class Configuracion < ActiveRecord::Base
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
end
