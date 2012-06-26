# Schema info

# Table name: oppsubstitutes

# id           : integer
# oppplayer_id    : integer
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

class Oppsubstitute < ActiveRecord::Base

  belongs_to :match
  belongs_to :oppplayer

end