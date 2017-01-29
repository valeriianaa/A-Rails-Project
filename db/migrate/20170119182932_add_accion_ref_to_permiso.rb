class AddAccionRefToPermiso < ActiveRecord::Migration
  def change
    add_reference :permisos, :accion, index: true, foreign_key: true
  end
end
