class LeadersController < ApplicationController

  def show
      @title = "Nottingham Forest - Leaders"
      @key = params[:key]
  end

end