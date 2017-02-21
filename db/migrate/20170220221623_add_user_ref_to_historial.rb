class AddUserRefToHistorial < ActiveRecord::Migration
  def change
    add_reference :historiales, :user, index: true, foreign_key: true
  end
end
