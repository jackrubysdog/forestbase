class ApplicationController < ActionController::Base
  protect_from_forgery
  
  require './requires/random_image'
  require './requires/season_record'
  require './requires/player_season_record'
  require './requires/player_record'
  require './requires/opponent_record'   

end
