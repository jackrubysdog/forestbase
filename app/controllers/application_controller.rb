class ApplicationController < ActionController::Base
  helper_method :opponentname
  
  protect_from_forgery
  # before_filter :ensure_domain
  
  require './requires/random_image'
  require './requires/season_record'
  require './requires/player_season_record'
  require './requires/player_record'
  require './requires/opponent_record'  
  
  # make sure current season is second menu option
  
  season = Season.last(:order => :season)
  @menu = Menu.find_by_id(2)
  @menu.update_attributes(:item => season.season, :link => "season_path(" + season.id.to_s + ")")
  
  #
  # RESTORE FOR DOMAIN MASK
  #
  # def ensure_domain 
  #  if request.env['HTTP_HOST'] != APP_ADDRESS && ENV["RAILS_ENV"] != 'development' 
  #    redirect_to("http://" + AP_ADDRESS) 
  #  end 
  # end 
  
 def opponentname(opponent,season)
    opponent = Opponent.find_by_id(opponent)
    if season >= opponent.previousnamestart and season <= opponent.previousnameend
    return opponent.previousname
    elsif season >= opponent.previousnamestart2 and season <= opponent.previousnameend2
      return opponent.previousname2
      else
      return opponent.shortname
    end
  end


end
