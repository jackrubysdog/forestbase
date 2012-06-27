class CreateSubstitutes < ActiveRecord::Migration
  def self.up
    create_table :substitutes do |t|
      t.integer :id
      t.integer :player_id
      t.integer :shirt
      t.integer :on
      t.boolean :subbed
      t.integer :off
      t.integer :subbedby
      t.boolean :booked
      t.integer :bookedtime
      t.boolean :sentoff
      t.integer :sentofftime
      t.integer :match_id

    end
  end

  def self.down
    drop_table :substitutes
  end
end
