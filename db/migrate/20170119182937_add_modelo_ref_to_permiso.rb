class AddModeloRefToPermiso < ActiveRecord::Migration
  def change
    add_reference :permisos, :modelo, index: true, foreign_key: true
  end
end
