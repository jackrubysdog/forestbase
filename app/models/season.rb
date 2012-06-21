# Schema info

# Table name: seasons

# id          : integer
# season      : string(255)
# division_id : integer       => divisions
# created_at  : datetime
# updated_at  : datetime

class Season < ActiveRecord::Base
  
  has_many    :matches
  belongs_to  :division
  
end
