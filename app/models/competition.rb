# Schema info

# Table name: competitions

# id           : integer
# abbrev       : string(255)
# name         : string(255)
# boolean      : domestic
# boolean      : european
# boolean      : international

class Competition < ActiveRecord::Base

  has_many :matches
  
end