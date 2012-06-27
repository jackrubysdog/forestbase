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
      t.integer :f
      t.integer :a
      t.integer :ht_f
      t.integer :ht_a
      t.boolean :extratime
      t.boolean :penalties
      t.integer :penalties_f
      t.integer :penalties_a
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
