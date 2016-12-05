class TipoDocumento < ActiveRecord::Base
	has_many :personas, dependent: :restrict_with_error
	
	validates :nombre, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
end
