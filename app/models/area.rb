class Area < ActiveRecord::Base
	validates :nombre, presence: true
	validates :nombre, uniqueness: true
end
