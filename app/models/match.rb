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
# f                 : integer
# a                 : integer
# ht_f              : integer
# ht_a              : integer
# extra_time        : boolean
# penalties         : boolean
# penaltiesfor      : integer
# penaltiesagainst  : integer
# referee_id        : integer
# attendance        : integer
# points            : integer
# position          : integer
# oppposition       : integer
# league_seq        : integer
# created_at        : datetime
# updated_at        : datetime

class Match < ActiveRecord::Base 
  
  belongs_to :season
  belongs_to :competition
  belongs_to :opponent
  belongs_to :venue
  belongs_to :referee
  has_many   :goals, :order=>"time"
  accepts_nested_attributes_for :goals,:reject_if => lambda { |x| x[:player_id].blank? }
  has_many   :oppgoals, :order=>"time"
  accepts_nested_attributes_for :oppgoals,:reject_if => lambda { |x| x[:oppplayer_id].blank? }
  has_many   :owngoals, :order=>"time"
  accepts_nested_attributes_for :owngoals,:reject_if => lambda { |x| x[:player_id].blank? }
  has_many   :oppowngoals, :order=>"time"
  accepts_nested_attributes_for :oppowngoals,:reject_if => lambda { |x| x[:oppplayer_id].blank? }
  has_many   :appearances, :order=>"shirt"
  accepts_nested_attributes_for :appearances,:reject_if => lambda { |x| x[:player_id].blank? }
  has_many   :substitutes, :order=>"shirt"
  accepts_nested_attributes_for :substitutes,:reject_if => lambda { |x| x[:player_id].blank? }
  has_many   :oppappearances, :order=>"shirt"
  accepts_nested_attributes_for :oppappearances,:reject_if => lambda { |x| x[:oppplayer_id].blank? }
  has_many   :oppsubstitutes, :order=>"shirt"
  accepts_nested_attributes_for :oppsubstitutes,:reject_if => lambda { |x| x[:oppplayer_id].blank? }
  has_one    :division, :through => :season
  has_one    :city, :through => :venue
  has_one    :country, :through => :city
  
end