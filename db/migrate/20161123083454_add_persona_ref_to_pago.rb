class AddPersonaRefToPago < ActiveRecord::Migration
  def change
    add_reference :pagos, :persona, index: true, foreign_key: true
  end
end
