class OpponentsController < ApplicationController
  def create
  end

  def edit
  end

  def index
    @title   = "Opponents"
    #104 are Forest!
    @opponents = Opponent.all(:conditions => ['id <> 104'], :order => 'name')
  end

  def new
  end

  def show
    @opponent = Opponent.find_by_id(params[:id])
    @title = "Nottingham Forest - " + @opponent.name
    @matches = Match.find_all_by_opponent_id(params[:id], :order => 'matchdate')
  end

  def update
  end
end
