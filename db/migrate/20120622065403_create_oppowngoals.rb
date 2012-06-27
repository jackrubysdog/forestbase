class CreateOppowngoals < ActiveRecord::Migration
  def change
    create_table :oppowngoals do |t|
      t.integer :id
      t.integer :oppplayer_id
      t.integer :time
      t.integer :match_id

    end
  end
end
