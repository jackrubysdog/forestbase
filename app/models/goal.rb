# Schema info

# Table name: goals

# id          : integer
# player_id   : string(255)
# penalty     : boolean
# time        : boolean
# match_id    : boolean
# created_at  : datetime
# updated_at  : datetime

class Goal < ActiveRecord::Base
  
  belongs_to :match
  belongs_to :player
  
end
