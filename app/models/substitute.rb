# Schema info

# Table name: substitutes

# id           : integer
# player_id    : integer
# shirt        : integer
# on           : integer
# subbed       : boolean
# off          : integer
# subbedby     : integer
# booked       : boolean
# bookedtime   : integer
# sentoff      : boolean
# sentofftime  : integer
# match_id     : integer

class Substitute < ActiveRecord::Base

  belongs_to :match
  belongs_to :player

end
