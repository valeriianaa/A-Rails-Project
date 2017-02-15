class CreateCuotasPorCliente < ActiveRecord::Migration
  def change
    create_table :cuotas_por_cliente do |t|
      t.float :montoTotal
      t.float :montoAcreditado
      t.boolean :estado

      t.timestamps null: false
    end
  end
end
