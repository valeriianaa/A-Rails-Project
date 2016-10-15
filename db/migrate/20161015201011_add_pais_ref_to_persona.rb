class AddPaisRefToPersona < ActiveRecord::Migration
  def change
    add_reference :personas, :pais, index: true, foreign_key: true
  end
end
