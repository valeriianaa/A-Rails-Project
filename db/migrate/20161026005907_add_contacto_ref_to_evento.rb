class AddContactoRefToEvento < ActiveRecord::Migration
  def change
    add_reference :eventos, :contacto, index: true, foreign_key: true
  end
end
