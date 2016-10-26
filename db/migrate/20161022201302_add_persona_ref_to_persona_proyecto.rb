class AddPersonaRefToPersonaProyecto < ActiveRecord::Migration
  def change
    add_reference :personas_proyectos, :persona, index: true, foreign_key: true
  end
end
