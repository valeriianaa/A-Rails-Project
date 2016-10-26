class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|

      t.timestamps null: false
    end
  end
end
