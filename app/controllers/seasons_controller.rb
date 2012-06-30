class SeasonsController < ApplicationController

  def new
    @title = "New Season"
  end
  
  def index
    @title   = "Seasons"
    @seasons = Season.find(:all,:order => "season DESC")
  end
  
  def show
    @season = Season.find(params[:id])
    @title = "Nottingham Forest - League Record " + @season.season
    @matches = Match.find_all_by_season_id(params[:id], :order => "matchdate")
    
    @temp = Array.new
       
    sql = "SELECT DISTINCT (player_id) FROM (SELECT DISTINCT(player_id) FROM appearances
            WHERE match_id IN (SELECT id FROM matches WHERE season_id=" + params[:id].to_s + 
           ") UNION SELECT DISTINCT(player_id) FROM substitutes WHERE match_id IN
            (SELECT id FROM matches WHERE season_id=" + params[:id].to_s + ")) AS x"
    
    @squad = Match.find_by_sql(sql)
    
    idx = 0
    
    @squad.each do |x|
      @temp.push(Player.find_by_id(x.player_id).name)
    end
    
    @temp.sort!
  
  end
  
end
