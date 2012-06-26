# Schema info

# Table name: oppgoals

# id           : integer
# oppplayer_id : string(255)
# penalty      : boolean
# time         : boolean
# match_id     : boolean
# created_at   : datetime
# updated_at   : datetime

class Oppgoal < ActiveRecord::Base

  belongs_to :match
  belongs_to :oppplayer

end
