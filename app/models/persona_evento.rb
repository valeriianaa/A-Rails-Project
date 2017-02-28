class PersonaEvento < ActiveRecord::Base
	belongs_to :persona 
	belongs_to :evento
end
