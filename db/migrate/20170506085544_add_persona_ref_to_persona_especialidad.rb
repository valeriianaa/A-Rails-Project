class AddPersonaRefToPersonaEspecialidad < ActiveRecord::Migration
  def change
    add_reference :personas_especialidades, :persona, index: true, foreign_key: true
  end
end
