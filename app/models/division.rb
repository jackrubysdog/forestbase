# Schema info

# Table name: divisions

# id          : integer
# name        : string(255)
# tier        : integer
# abbrev      : string(255)
# created_at  : datetime
# updated_at  : datetime

class Division < ActiveRecord::Base

  has_many :seasons

end
