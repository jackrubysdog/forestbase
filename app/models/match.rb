  # Schema info

# Table name: matches

# id                : integer
# season_id         : integer
# matchdate         : datetime
# opponent_id       : integer
# venue_id          : integer
# han               : string (1)
# competition_id    : integer
# round             : integer
# leg               : integer
# replay            : integer
# for               : integer
# against           : integer
# ht_for            : integer
# ht_against        : integer
# extra_time        : boolean
# penalties         : boolean
# penaltiesfor      : integer
# penaltiesagainst  : integer
# referee_id        : integer
# attendance        : integer
# points            : integer
# position          : integer
# oppposition       : integer
# created_at        : datetime
# updated_at        : datetime

class Match < ActiveRecord::Base
  
  belongs_to :season
  belongs_to :competition
  belongs_to :opponent
  belongs_to :venue
  belongs_to :referee
  has_many   :goals
  has_many   :oppgoals
  has_many   :owngoals
  has_many   :oppowngoals
  has_many   :appearances
  has_many   :substitutes
  has_many   :oppappearances
  has_many   :oppsubstitutes
  has_one    :division, :through => :season
  has_one    :city, :through => :venue
  has_one    :country, :through => :city
  
end