class CreatePagosRealizados < ActiveRecord::Migration
  def change
    create_table :pagos_realizados do |t|
      t.date :fecha
      t.float :monto

      t.timestamps null: false
    end
  end
end
