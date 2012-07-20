class OpponentRecord < ActiveRecord::Base

def initialize(id)
  @opponent_id = id
end

def firstgame
  firstgame = Match.find(:first,:conditions=>{:opponent_id=>@opponent_id},:order=>:matchdate)
  
  if firstgame.competition_id == 1
    competition = firstgame.division.abbrev
  else
    competition = firstgame.competition.abbrev
  end
  
   if firstgame.f > firstgame.a
    result = "W"
  elsif firstgame.f == firstgame.a
    result = "D"
  else
    result = "L"
  end
 
  @firstgame = "<a href='/matches/" + firstgame.id.to_s + "' >" + firstgame.matchdate.strftime("%d %b %Y") + "</a> " + competition + " " + firstgame.han + " " + result + " " + firstgame.f.to_s + "-" + firstgame.a.to_s
end

def lastgame
  lastgame = Match.find(:last,:conditions=>{:opponent_id=>@opponent_id},:order=>:matchdate)
  
  if lastgame.competition_id == 1
    competition = lastgame.division.abbrev
  else
    competition = lastgame.competition.abbrev
  end
  
  if lastgame.f > lastgame.a
    result = "W"
  elsif lastgame.f == lastgame.a
    result = "D"
  else
    result = "L"
  end
 
  @lastgame = "<a href='/matches/" + lastgame.id.to_s + "' >" + lastgame.matchdate.strftime("%d %b %Y") + "</a> " + competition + " " + lastgame.han + " " + result + " " + lastgame.f.to_s + "-" + lastgame.a.to_s
end
  
def played
  @played = Match.find(:all,:conditions=>{:opponent_id=>@opponent_id,:competition_id=>1}).count
end

def won
  @won = Match.count(:conditions => ['opponent_id = ? AND competition_id = 1 AND f > a',@opponent_id])
end

def drawn
  @drawn = Match.count(:conditions => ['opponent_id = ? AND competition_id = 1 AND f = a',@opponent_id])
end

def lost
  @lost = Match.count(:conditions => ['opponent_id = ? AND competition_id = 1 AND f < a',@opponent_id])
end

def f
  @f = Match.sum('f',:conditions => ['opponent_id = ? AND competition_id = 1',@opponent_id])
end

def a
  @a = Match.sum('a',:conditions => ['opponent_id = ? AND competition_id = 1',@opponent_id])
end

end