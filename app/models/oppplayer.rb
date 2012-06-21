
# Table name: oppplayer

# id                    : integer
# name                  : string(255)
# birthplace            : string(255)
# country_id            : integer
# deathdate             : datetime
# firstnames            : string(255)
# knownname             : string(255)
# birthdate             : datetime
# playingcareer         : string(255)
# positionfull          : string(255)
# shortname             : string(255)

class Oppplayer < ActiveRecord::Base

  belongs_to  :country
  has_many    :owngoals
  
end
