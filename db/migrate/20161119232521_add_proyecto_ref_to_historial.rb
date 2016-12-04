class AddProyectoRefToHistorial < ActiveRecord::Migration
  def change
    add_reference :historiales, :proyecto, index: true, foreign_key: true
  end
end
