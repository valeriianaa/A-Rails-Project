class CreateActividadesProyectos < ActiveRecord::Migration
  def change
    create_table :actividades_proyectos do |t|
      t.date :fechaVencimiento

      t.timestamps null: false
    end
  end
end
