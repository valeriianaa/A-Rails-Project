class AddLogotipoToConfiguraciones < ActiveRecord::Migration
  def change
    add_column :configuraciones, :logotipo, :string
  end
end
