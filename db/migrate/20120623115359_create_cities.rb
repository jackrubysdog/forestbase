class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :id
      t.text :name
      t.integer :country_id

    end
  end
end
