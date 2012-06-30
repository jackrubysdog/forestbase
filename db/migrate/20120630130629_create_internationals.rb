class CreateInternationals < ActiveRecord::Migration
  def change
    create_table :internationals do |t|
      t.integer :id
      t.integer :player_id
      t.integer :country_id
      t.date :matchdate
      t.string :competition
      t.string :venue
      t.string :han
      t.integer :f
      t.integer :a
      t.integer :shirt
      t.integer :on
      t.integer :off
      t.integer :goals

    end
  end
end
