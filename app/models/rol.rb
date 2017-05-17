class Rol < ActiveRecord::Base
  has_many :user, dependent: :restrict_with_error
  has_and_belongs_to_many :permisos
    
  def can_modelos
    models = permisos.map {|e| e.modelo}
    models.uniq
  end

  def permisos_by_modelo(modelo)
    permisos.select { |e| e.modelo == modelo }
  end

  def can?(modelo, accion)
    perms = permisos.select {|e| e.modelo == modelo and accion == e.accion}
    if perms.size == 0
      return false
    else
      return true
    end 
  end
end
