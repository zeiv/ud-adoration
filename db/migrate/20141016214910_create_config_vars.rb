class CreateConfigVars < ActiveRecord::Migration
  def change
    create_table :config_vars do |t|
      t.string :name
      t.string :value
      t.boolean :boolean_value

      t.timestamps
    end
  end
end
