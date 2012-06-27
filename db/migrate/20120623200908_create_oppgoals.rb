class CreateOppgoals < ActiveRecord::Migration
  def change
    create_table :oppgoals do |t|
      t.integer :id
      t.integer :oppplayer_id
      t.integer :time
      t.boolean :penalty
      t.integer :match_id

    end
  end
end
