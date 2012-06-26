class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :city_id
      t.integer :id

      t.timestamps
    end
  end
end
