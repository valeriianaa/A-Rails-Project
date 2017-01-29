class AddRelationshipBetweenPermisoAndRol < ActiveRecord::Migration
  def change
    create_table :permisos_roles, id: false do |t|
      t.belongs_to :permiso, index: true
      t.belongs_to :rol, index: true
    end
  end
end
