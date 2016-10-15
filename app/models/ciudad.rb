class Ciudad < ActiveRecord::Base
	belongs_to :provincia
	belongs_to :pais
end
