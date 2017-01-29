class Accion < ActiveRecord::Base
  has_many :permisos, dependent: :destroy
  has_many :modelos, through: :permisos

  validates :nombre, :key_name, presence: true
  validates :nombre, :key_name, uniqueness: true
  #validates :modelo_ids, presence: true, :if => :modelo?

  def modelo?
  	if Modelo.exists?
  		return true
  	else
  		return false
  	end
  end

end
