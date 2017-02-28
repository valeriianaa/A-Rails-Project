class AddPersonaRefToPersonaEvento < ActiveRecord::Migration
  def change
    add_reference :personas_eventos, :persona, index: true, foreign_key: true
  end
end
