class CreateSquadnumbers < ActiveRecord::Migration
  def change
    create_table :squadnumbers do |t|
      t.integer :id
      t.integer :player_id
      t.integer :season_id
      t.integer :number

    end
  end
end
