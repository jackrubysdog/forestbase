# Schema info

# Table name: oppappearances

# id           : integer
# oppplayer_id : integer
# shirt        : integer
# off          : integer
# subbedby     : integer
# booked       : boolean
# bookedtime   : integer
# sentoff      : boolean
# sentofftime  : integer
# match_id     : integer

class Oppappearance < ActiveRecord::Base

belongs_to  :match
belongs_to  :oppplayer

end
