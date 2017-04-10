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
	#validates :logotipo, :file_geometry => {:max_width=>300, :max_height => 300}


	# validate :validate_minimum_image_size

	# def validate_minimum_image_size
	#     geometry = self.logotipo.geometry
	#     if (! geometry.nil?)
	#         self.width = geometry[0]
	#         self.height = geometry[1]
	#     end
	#     unless (self.width > 300 && self.height > 300)
	#         errors.add :base, "Naughty you... iPhone designs should be 320px x 480px or 640px x 960px." 
	#     end
	# end
	
end
