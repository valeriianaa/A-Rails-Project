class EspecialidadDeContacto < ActiveRecord::Base
	has_many :personas_especialidades, dependent: :restrict_with_error
	has_many :personas, :through => :personas_especialidades, dependent: :restrict_with_error

	has_many :eventos_especialidades, dependent: :restrict_with_error
	has_many :eventos, :through => :eventos_especialidades, dependent: :restrict_with_error

	validates :nombre, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
	audited
end
