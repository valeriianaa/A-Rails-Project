class AddRolRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :rol, index: true, foreign_key: true
  end
end
