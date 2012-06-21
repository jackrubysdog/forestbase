# Schema info

# Table name: goals

# id          : integer
# player_id   : integer
# time        : integer
# match_id    : integer

class Owngoal < ActiveRecord::Base

  belongs_to :match
  belongs_to :oppplayer

end
