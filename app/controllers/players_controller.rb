class PlayersController < ApplicationController
  def index
    @title   = "Players"
    @key     = params[:key]
    
    if params[:key] == "XYZ"
    @players = Player.find(:all, :conditions => ["name LIKE ? OR name LIKE ? OR name LIKE ?", "X%", "Y%", "Z%"], :order => 'name ASC')
    else
    @players = Player.find(:all, :conditions => ['name LIKE ?', "#{params[:key]}%"], :order => 'name ASC')
    end
  end

  def show
    @player = Player.find_by_id(params[:id])
    @title = "Nottingham Forest - " + @player.knownname
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

end
