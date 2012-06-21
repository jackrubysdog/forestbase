# Schema info

# Table name: appearances

# id           : integer
# player_id    : integer
# shirt        : integer
# off          : integer
# subbedby     : integer
# booked       : boolean
# bookedtime   : integer
# sentoff      : boolean
# sentofftime  : integer
# match_id     : integer

class Appearance < ActiveRecord::Base

belongs_to  :match
belongs_to  :player

end
