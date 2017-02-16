class CreatePagosMetodos < ActiveRecord::Migration
  def change
    create_table :pagos_metodos do |t|
      t.float :monto

      t.timestamps null: false
    end
  end
end
