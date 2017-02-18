class CreateDbBackups < ActiveRecord::Migration
  def change
    create_table :db_backups do |t|

      t.timestamps null: false
    end
  end
end
