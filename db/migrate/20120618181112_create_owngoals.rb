class CreateOwngoals < ActiveRecord::Migration
  def self.up
    create_table :owngoals do |t|
      t.integer  :id
      t.integer  :oppplayer_id
      t.integer  :time
      t.integer  :match_id

    end
  end

  def self.down
    drop_table :owngoals
  end
end
