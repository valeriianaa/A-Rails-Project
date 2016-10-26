class AddPaisRefToProyecto < ActiveRecord::Migration
  def change
    add_reference :proyectos, :pais, index: true, foreign_key: true
  end
end
