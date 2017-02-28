class Evento < ActiveRecord::Base
	belongs_to :persona
	has_many :eventos_proyectos, dependent: :restrict_with_error
	has_many :proyectos , :through => :eventos_proyectos

	has_many :personas_eventos, dependent: :destroy
	has_many :personas , :through => :personas_eventos, :inverse_of => :personas_eventos

	validates :codigo, :nombre, :dia, :hora, presence: true
	#validates :nombre, uniqueness: true
	validates :nombre, uniqueness: { case_sensitive: false, scope: [:dia, :hora], message: "Ya existe un evento con este nombre en la misma fecha y hora" }
	validates :codigo, uniqueness: true

	audited

end
