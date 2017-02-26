class Accion < ActiveRecord::Base
  has_many :permisos, dependent: :restrict_with_error
  has_many :modelos, through: :permisos

  validates :nombre, :key_name, presence: true
  #validates :nombre, :key_name, uniqueness: true
  validates :nombre, uniqueness: { case_sensitive: false}
  validates :key_name, uniqueness: { case_sensitive: false}

  validates :modelo_ids, presence: true, :if => :modelo?

  def modelo?
  	if Modelo.exists?
  		return true
  	else
  		return false
  	end
  end

  HUMANIZED_ATTRIBUTES = {
    :nombre => "Nombre: ",
    :key_name => "Palabra Clave: "
  }

  def self.human_attribute_name(*args)
    puts "self.human_attribute_name"
    puts "[args[0]]", args[0]
    HUMANIZED_ATTRIBUTES[args[0]] || super
  end


end
