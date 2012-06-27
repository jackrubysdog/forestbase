class CreateReferees < ActiveRecord::Migration
  def change
    create_table :referees do |t|
      t.integer :id
      t.string :name
      t.string :residence
    end
  end
end
