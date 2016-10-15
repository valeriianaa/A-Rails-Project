class AddPaisRefToProvincia < ActiveRecord::Migration
  def change
    add_reference :provincias, :pais, index: true, foreign_key: true
  end
end
