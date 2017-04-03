class Configuracion < ActiveRecord::Base
	mount_uploader :logotipo, LogotipoUploader
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area

	validates :nombre, :cuit, :condicion_iva, :presence => true
	validates :pais_id, :provincia_id, :ciudad_id, :area_id, :presence => true
	validates :cuit, :uniqueness => true

	validate :check_logotipo_dimensions
	  
  	def check_logotipo_dimensions
    	::Rails.logger.info "logotipo upload dimensions: #{self.avatar_upload_width}x#{self.avatar_upload_height}"
    	errors.add :logotipo, "Las dimensiones del logotipo no deben ser mayores a 300x300 pixeles." if self.avatar_upload_width < 300 || avatar_upload_height < 300
  	end
	
end
