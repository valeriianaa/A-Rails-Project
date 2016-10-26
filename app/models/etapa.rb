class Etapa < ActiveRecord::Base
	has_many :actividades, dependent: :restrict_with_exception
	has_many :proyectos, dependent: :restrict_with_exception

	validates :nombre, presence: true
	validates :nombre, uniqueness: true
	
	def que_color
		num = self.id
		if (num <= 4)
			return num-1
		else
			return (num%4)-1
		end
	end
end
