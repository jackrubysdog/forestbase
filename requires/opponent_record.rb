class OpponentRecord < ActiveRecord::Base

def initialize(id)
  @opponent_id = id
end

def firstgame
  firstgame = Match.find(:first,:conditions=>{:opponent_id=>@opponent_id})
  
  if firstgame.competition_id == 1
    competition = firstgame.division.abbrev
  else
    competition = firstgame.competition.abbrev
  end
  
  if firstgame.for > firstgame.against
    result = "W "
  elsif firstgame.for == firstgame.against
    result = "D "
  else
    result = "L "
  end
 
  @firstgame = firstgame.matchdate.strftime("%d %b %Y") + " " + competition + " " + firstgame.han + " " + result + firstgame.for.to_s + "-" + firstgame.against.to_s
end

def lastgame
  lastgame = Match.find(:last,:conditions=>{:opponent_id=>@opponent_id})
  
  if lastgame.competition_id == 1
    competition = lastgame.division.abbrev
  else
    competition = lastgame.competition.abbrev
  end
  
  if lastgame.for > lastgame.against
    result = "W "
  elsif lastgame.for == lastgame.against
    result = "D "
  else
    result = "L "
  end
 
  @lastgame = lastgame.matchdate.strftime("%d %b %Y") + " " + competition + " " + lastgame.han + " " + result + lastgame.for.to_s + "-" + lastgame.against.to_s
end

def played
  @played = Match.find(:all,:conditions=>{:opponent_id=>@opponent_id,:competition_id=>1}).count
end

def won
  @won = Match.count(:conditions => ['opponent_id = ? AND competition_id = 1 AND for > against',@opponent_id])
end

def drawn
  @drawn = Match.count(:conditions => ['opponent_id = ? AND competition_id = 1 AND for = against',@opponent_id])
end

def lost
  @lost = Match.count(:conditions => ['opponent_id = ? AND competition_id = 1 AND for < against',@opponent_id])
end

def for
  @for = Match.sum('for',:conditions => ['opponent_id = ? AND competition_id = 1',@opponent_id])
end

def against
  @against = Match.sum('against',:conditions => ['opponent_id = ? AND competition_id = 1',@opponent_id])
end

end