class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer :id
      t.text :name
      t.text :shortname
      t.text :birthplace
      t.date :birthdate
      t.text :position
      t.text :knownname
      t.text :firstnames
      t.date :deathdate
      t.integer :country_id
      t.text :positionfull
      t.integer :number
      t.boolean :active
      t.date :loandatesigned
      t.text :loanedfrom
      t.date :datesigned
      t.text :signedfrom
      t.integer :signedfee
      t.date :datesold
      t.text :soldto
      t.integer :soldfee
      t.date :datesignedsecondspell
      t.text :signedfromsecondspell
      t.integer :signedfeesecondspell
      t.date :datesoldsecondspell
      t.text :soldtosecondspell
      t.integer :soldfeesecondspell
      t.text :playingcareer
      t.text :managerialcareer
      t.text :penpicture
      t.integer :capsbefore
      t.integer :capsafter
    end
  end

  def self.down
    drop_table :players
  end
end
