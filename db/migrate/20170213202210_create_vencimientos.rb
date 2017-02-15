class CreateVencimientos < ActiveRecord::Migration
  def change
    create_table :vencimientos do |t|
      t.date :fecha

      t.timestamps null: false
    end
  end
end
