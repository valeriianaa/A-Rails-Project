class Configuracion < ActiveRecord::Base
	attr_accessor :logotipo_width, :logotipo_height
	mount_uploader :logotipo, LogotipoUploader
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area

	validates :nombre, :cuit, :condicion_iva, :presence => true
	validates :pais_id, :provincia_id, :ciudad_id, :area_id, :presence => true
	validates :cuit, :uniqueness => true
	validates :logotipo, presence: true
	
end
