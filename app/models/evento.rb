class Evento < ActiveRecord::Base
	belongs_to :persona

	has_many :eventos_proyectos, dependent: :destroy
	has_many :proyectos , :through => :eventos_proyectos

	validates :codigo, :nombre, :dia, :hora, :persona_id, presence: true
	#validates :nombre, uniqueness: true
	validates :nombre, uniqueness: { case_sensitive: false, scope: [:dia, :hora], message: "Ya existe un evento con este nombre en la misma fecha y hora" }
	validates :codigo, uniqueness: true

	audited
end
