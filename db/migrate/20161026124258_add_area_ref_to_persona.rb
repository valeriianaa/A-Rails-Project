class AddAreaRefToPersona < ActiveRecord::Migration
  def change
    add_reference :personas, :area, index: true, foreign_key: true
  end
end
