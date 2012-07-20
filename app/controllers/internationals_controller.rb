class InternationalsController < ApplicationController

  def new
    @title = "Nottingham Forest - New International"
    @international = International.new
  end
  
  def create
    @international = International.new(params[:international])
    if @international.save
      redirect_to @international.player_id
    else
      @title = "Nottingham Forest - New International"
      render 'new'    
    end
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
