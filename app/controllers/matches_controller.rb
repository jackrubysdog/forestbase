class MatchesController < ApplicationController

  def show
    @match = Match.find_by_id(params[:id])
    @title = "Nottingham Forest - " + @match.matchdate.to_s + " v " + @match.opponent.shortname + " (" + @match.han + ")" 
  end

  def edit
  end

  def update
  end
end
