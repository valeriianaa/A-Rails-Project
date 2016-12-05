class AddPersonaRefToEvento < ActiveRecord::Migration
  def change
    add_reference :eventos, :persona, index: true, foreign_key: true
  end
end
