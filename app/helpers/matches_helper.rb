module MatchesHelper
  
  def getsquadnumber(shirt,player_id,season_id)
  
  squadnumber = Squadnumber.find_by_player_id_and_season_id(player_id,season_id)
  
  if squadnumber.nil?
    squadnumber = shirt
  else
    squadnumber = squadnumber.number
  end
  
  end

  def checkforlastgame(match_id)
    lastgame = Match.last
    if lastgame.id == match_id
      true
    else
      false
    end
  end


end
