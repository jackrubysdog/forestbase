# Schema info

# Table name: venues

# id          : integer
# player_id   : integer
# season_id   : integer
# updated_at  : datetime

class Squadnumber < ActiveRecord::Base
  
belongs_to :player

end
