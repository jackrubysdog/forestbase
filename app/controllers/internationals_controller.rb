class InternationalsController < ApplicationController
  def new
  end

  def update
  end

  def create
  end

  def show
    player_id = params[:id]
    @internationals = International.find_all_by_player_id(player_id,:order=>:matchdate)
    @player = Player.find_by_id(player_id)
    unless @player.nil?
      @title = "Nottingham Forest Internationals - " + @player.knownname
    else
      @title = "Nottingham Forest Internationals - David Tarka"
    end  
  end

  def index
    @title   = "Internationals"
    @internationals = International.all(:order => "matchdate")
  end
end
