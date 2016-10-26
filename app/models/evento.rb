class Evento < ActiveRecord::Base
	validates :nombre, :dia, :hora, :contacto_id presence: true
	validates :nombre, uniqueness: true
end
