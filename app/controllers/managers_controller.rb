class ManagersController < ApplicationController

  def index
    @title   = "Managers"
    @managers = Manager.all(:order => "startdate DESC")
  end

  def show
    @manager = Manager.find_by_id(params[:id])
    @title = "Nottingham Forest - " + @manager.informalname 
  end

  def new
  end

  def update
  end
end
