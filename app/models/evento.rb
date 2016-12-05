class Evento < ActiveRecord::Base
	validates :nombre, :dia, :hora, :contacto_id, presence: true
	#validates :nombre, uniqueness: true
	validates :nombre, uniqueness: { case_sensitive: false, scope: [:dia, :hora], message: "Ya existe un evento con este nombre en la misma fecha y hora" }
end
