class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.date :fecha
      t.float :monto

      t.timestamps null: false
    end
  end
end
