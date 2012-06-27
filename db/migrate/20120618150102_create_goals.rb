class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.integer :id
      t.integer :player_id
      t.boolean :penalty
      t.integer :time
      t.integer :match_id

    end
  end

  def self.down
    drop_table :goals
  end
end
