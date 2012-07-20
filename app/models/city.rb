# Schema info

# Table name: cities

# id          : integer
# name        : string(255)
# country_id  : integer
# created_at  : datetime
# updated_at  : datetime

class City < ActiveRecord::Base

  belongs_to :country
  has_many   :venues
  
end
