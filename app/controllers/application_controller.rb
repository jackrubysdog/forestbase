class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ensure_domain, :authorize
  
  require './requires/random_image'
  require './requires/season_record'
  require './requires/player_season_record'
  require './requires/player_record'
  require './requires/opponent_record'  
  
  def ensure_domain 
    if request.env['HTTP_HOST'] != APP_ADDRESS && ENV["RAILS_ENV"] != 'development' 
      redirect_to("http://" + AP_ADDRESS) 
    end 
  end 

end
