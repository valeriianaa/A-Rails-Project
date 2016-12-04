class AddEstadoRefToHistorial < ActiveRecord::Migration
  def change
    add_reference :historiales, :estado, index: true, foreign_key: true
  end
end
