class CreateDivisions < ActiveRecord::Migration
  def self.up
    create_table :divisions do |t|
      t.string :name
      t.integer :tier
      t.string :abbrev

    end
  end

  def self.down
    drop_table :divisions
  end
end
