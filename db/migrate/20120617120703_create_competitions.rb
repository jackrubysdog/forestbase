class CreateCompetitions < ActiveRecord::Migration
  def self.up
    create_table :competitions do |t|
      t.integer :id
      t.string :abbrev
      t.string :name
      t.boolean :domestic
      t.boolean :european
      t.boolean :international
      
    end
  end

  def self.down
    drop_table :competitions
  end
end
