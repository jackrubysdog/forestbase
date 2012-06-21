class CreateOpponents < ActiveRecord::Migration
  def self.up
    create_table :opponents do |t|
      t.integer :id
      t.string :name
      t.string :shortname
      t.integer :previousnamestart
      t.integer :previousnameend
      t.string :previousname
      t.string :previousname2
      t.integer :previousnamestart2
      t.integer :previousnameend2
      t.integer :city_id

      t.timestamps
    end
  end

  def self.down
    drop_table :opponents
  end
end
