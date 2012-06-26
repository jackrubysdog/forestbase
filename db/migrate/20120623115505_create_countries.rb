class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.integer :id
      t.text :name
      t.text :code

      t.timestamps
    end
  end
end
