# Schema info

# Table name: countries

# id          : integer
# name        : string(255)
# code        : string

class Country < ActiveRecord::Base

  has_many :cities
  has_many :internationals
  
end
