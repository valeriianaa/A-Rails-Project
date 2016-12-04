class CreateCuotasPorCliente < ActiveRecord::Migration
  def change
    create_table :cuotas_por_cliente do |t|
      t.string :mensaje
      t.float :montoTotal
      t.float :montoAcreditado

      t.timestamps null: false
    end
  end
end
