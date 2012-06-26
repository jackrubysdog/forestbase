class OpponentsController < ApplicationController
  def create
  end

  def edit
  end

  def index
    @title   = "Opponents"
    #104 are Forest!
    @opponents = Opponent.where('id <> 104')
  end

  def new
  end

  def show
    @opponent = Opponent.find_by_id(params[:id])
    @title = "Nottingham Forest - " + @opponent.name
    @matches = Match.find_all_by_opponent_id(params[:id])
  end

  def update
  end
end
