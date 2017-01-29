class Permiso < ActiveRecord::Base
	belongs_to :modelo
	belongs_to :accion
	has_and_belongs_to_many :roles
end
