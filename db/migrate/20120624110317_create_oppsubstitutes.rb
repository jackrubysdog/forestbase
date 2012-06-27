class CreateOppsubstitutes < ActiveRecord::Migration
  def change
    create_table :oppsubstitutes do |t|
      t.integer :id
      t.integer :oppplayer_id
      t.integer :shirt
      t.integer :on
      t.integer :subbed
      t.integer :off
      t.integer :subbedby
      t.boolean :booked
      t.integer :bookedtime
      t.boolean :sentoff
      t.boolean :sentofftime
      t.integer :match_id

    end
  end
end
