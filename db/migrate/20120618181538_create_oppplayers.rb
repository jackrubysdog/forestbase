class CreateOppplayers < ActiveRecord::Migration
  def self.up
    create_table :oppplayers do |t|
      t.integer :id
      t.integer :name
      t.text :birthplace
      t.integer :country_id
      t.date :deathdate
      t.text :firstnames
      t.text :knownname
      t.date :birthdate
      t.text :playingcareer
      t.text :positionfull
      t.text :shortname

      t.timestamps
    end
  end

  def self.down
    drop_table :oppplayers
  end
end
