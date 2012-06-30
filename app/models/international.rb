# Schema info

# Table name: international

# id                : integer
# player_id         : integer
# country_id        : integer
# matchdate         : datetime
# competition       : string
# venue             : string
# han               : string
# f                 : integer
# a                 : integer
# shirt             : integer
# on                : integer
# off               : integer
# goal              : integer

class International < ActiveRecord::Base
  
  belongs_to :player
  belongs_to :country
  
end
