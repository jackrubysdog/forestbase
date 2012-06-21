# Schema info

# Table name: opponents

# id                    : integer
# name                  : string(255)
# shortname             : string(255)
# birthplace            : string(255)
# birthdate             : datetime
# position              : string(255)
# knownname             : string(255)
# firstnames            : string(255)
# deathdate             : datetime
# country_id            : integer
# positionfull          : string(255)
# number                : integer
# loandatesigned        : datetime
# loanedfrom            : string(255)
# datesigned            : datetime
# signedfrom            : string(255)
# signedfee             : integer
# datesold              : datetime
# soldto                : string(255)
# soldfee               : integer
# datesignedsecondspell : datetime
# signedfromsecondspell : string(255)
# signedfeesecondspell  : integer
# datesoldsecondspell   : datetime
# soldtosecondspell     : string(255)
# soldfeesecondspell    : integer
# playingcareer         : string(255)
# managerialcareer      : string(255)
# penpicture            : string(255)

class Player < ActiveRecord::Base

belongs_to  :country
has_many    :goals
has_many    :appearances
has_many    :substitutes
  
end
