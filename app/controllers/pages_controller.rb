class PagesController < ApplicationController
  
  def home
    @title = "Home"
  end
  
  def seasons
    @title = "Season"
  end

end
