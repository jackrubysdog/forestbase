# Schema info

# Table name: referees

# id          : integer
# name        : string(255)
# residence   : string(255)
# created_at  : datetime
# updated_at  : datetime

class Referee < ActiveRecord::Base
  
  has_many :matches
  
end
