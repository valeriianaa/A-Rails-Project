class AddPersonaRefToContrato < ActiveRecord::Migration
  def change
    add_reference :contratos, :persona, index: true, foreign_key: true
  end
end
