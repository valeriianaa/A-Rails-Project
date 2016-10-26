class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.date :dia

      t.timestamps null: false
    end
  end
end
