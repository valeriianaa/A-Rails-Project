class AddEtapaRefToActividad < ActiveRecord::Migration
  def change
    add_reference :actividades, :etapa, index: true, foreign_key: true
  end
end
