class AddProvinciaRefToPersona < ActiveRecord::Migration
  def change
    add_reference :personas, :provincia, index: true, foreign_key: true
  end
end
