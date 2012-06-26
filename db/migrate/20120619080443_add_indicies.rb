class AddIndicies < ActiveRecord::Migration
  
  def self.up
    add_index :appearances, :id, :unique => true
    add_index :appearances, :match_id
    add_index :appearances, :player_id
    
    add_index :goals, :id, :unique => true
    add_index :goals, :match_id
    add_index :goals, :player_id
    
    add_index :matches, :id, :unique => true
    add_index :matches, :season_id
    add_index :matches, :opponent_id
    
    add_index :opponents, :id, :unique => true
    
    add_index :oppplayers, :id, :unique => true
    
    add_index :players, :id, :unique => true
    add_index :players, :name
    
    add_index :seasons, :id, :unique => true
    
    add_index :substitutes, :id, :unique => true
    add_index :substitutes, :match_id
    add_index :substitutes, :player_id
  end

  def self.down
    remove_index :appearances, :id
    remove_index :appearances, :player_id
    
    remove_index :goals, :id
    remove_index :goals, :match_id
    remove_index :goals, :player_id
        
    remove_index :opponents, :id
    
    remove_index :seasons, :id
    
    remove_index :substitutes, :id
    remove_index :substitutes, :match_id
    remove_index :substitutes, :player_id
  end
  
end
