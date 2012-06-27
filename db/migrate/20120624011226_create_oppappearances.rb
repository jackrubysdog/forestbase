class CreateOppappearances < ActiveRecord::Migration
  def change
    create_table :oppappearances do |t|
      t.integer :id
      t.integer :oppplayer_id
      t.integer :shirt
      t.integer :off
      t.integer :subbedby
      t.boolean :booked
      t.integer :bookedtime
      t.boolean :sentoff
      t.integer :sentofftime
      t.integer :match_id

    end
  end
end
