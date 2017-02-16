class CreateCuentas < ActiveRecord::Migration
  def change
    create_table :cuentas do |t|
      t.float :saldo

      t.timestamps null: false
    end
  end
end
