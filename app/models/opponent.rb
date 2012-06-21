# Schema info

# Table name: opponents

# id                 : integer
# name               : string(255)
# shortname          : string(255)
# previousnamestart  : integer
# previousnameend    : integer
# previousname       : string
# previousname2      : string
# previousnamestart2 : integer
# previousnameend2   : integer
# city_id            : integer

class Opponent < ActiveRecord::Base
  
  has_many :matches
  
end
