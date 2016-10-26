class AddEtapaRefToProyecto < ActiveRecord::Migration
  def change
    add_reference :proyectos, :etapa, index: true, foreign_key: true
  end
end
