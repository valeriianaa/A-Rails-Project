class CreateActividadesProyectos < ActiveRecord::Migration
  def change
    create_table :actividades_proyectos do |t|
      t.date :fechaInicio
      t.date :fechaFinEstimada
      t.date :fechaFinActual

      t.timestamps null: false
    end
  end
end
