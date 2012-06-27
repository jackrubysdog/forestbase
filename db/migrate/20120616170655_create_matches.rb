class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.integer :id
      t.integer :season_id
      t.date    :matchdate
      t.integer :opponent_id
      t.integer :venue_id
      t.string :han
      t.integer :competition_id
      t.string :round
      t.integer :leg
      t.integer :replay
      t.integer :for
      t.integer :against
      t.integer :ht_for
      t.integer :ht_against
      t.boolean :extratime
      t.boolean :penalties
      t.integer :penaltiesfor
      t.integer :penaltiesagainst
      t.integer :referee_id
      t.integer :attendance
      t.integer :points
      t.integer :position
      t.integer :oppposition
      
    end
  end

  def self.down
    drop_table :matches
  end
end
