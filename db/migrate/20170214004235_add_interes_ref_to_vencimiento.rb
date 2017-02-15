class AddInteresRefToVencimiento < ActiveRecord::Migration
  def change
    add_reference :vencimientos, :interes, index: true, foreign_key: true
  end
end
