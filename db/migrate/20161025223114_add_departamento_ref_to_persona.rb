class AddDepartamentoRefToPersona < ActiveRecord::Migration
  def change
    add_reference :personas, :departamento, index: true, foreign_key: true
  end
end
