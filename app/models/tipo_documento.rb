class TipoDocumento < ActiveRecord::Base
	has_many :personas, dependent: :restrict_with_exception
	
	validates :nombre, presence: true
	validates :nombre, uniqueness: true
end
