class CreateAppearances < ActiveRecord::Migration
  def self.up
    create_table :appearances do |t|
      t.integer :id
      t.integer :player_id
      t.integer :shirt
      t.integer :off
      t.integer :subbedby
      t.boolean :booked
      t.integer :bookedtime
      t.boolean :sentoff
      t.integer :sentofftime
      t.integer :match_id

      t.timestamps
    end
  end

  def self.down
    drop_table :appearances
  end
end
