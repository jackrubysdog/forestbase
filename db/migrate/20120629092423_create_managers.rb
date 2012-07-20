class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.integer :id
      t.string :name
      t.string :informalname
      t.date :startdate
      t.date :enddate
      t.string :managertype
      t.string :penpicture

    end
  end
end
