class Estado < ActiveRecord::Base
	validates_uniqueness_of :ultimo, if: :ultimo
	validates :nombre, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
	has_many :historiales, dependent: :restrict_with_error
	validates :previous, presence: true

	audited
end
