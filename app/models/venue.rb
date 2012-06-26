# Schema info

# Table name: venues

# id          : integer
# name        : string(255)
# city_id     : integer
# created_at  : datetime
# updated_at  : datetime

class Venue < ActiveRecord::Base

  belongs_to :city
  has_many   :matches
  
end
