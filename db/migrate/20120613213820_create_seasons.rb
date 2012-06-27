class CreateSeasons < ActiveRecord::Migration
  def self.up
    create_table :seasons do |t|
      t.string :season
      t.integer :division_id

    end
  end

  def self.down
    drop_table :seasons
  end
end
