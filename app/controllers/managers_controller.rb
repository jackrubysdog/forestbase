class ManagersController < ApplicationController

  def index
    @title   = "Managers"
    @managers = Manager.all(:order => "startdate DESC")
  end

  def show
    @manager = Manager.find_by_id(params[:id])
    @title = "Nottingham Forest - " + @manager.informalname 
  end
  
  def edit
    
    @manager = Manager.find(params[:id])
    @title = "Nottingham Forest - " + @manager.informalname + " - Edit"    
    
  end


  def update
    
    @manager = Manager.find(params[:id])
 
    if @manager.update_attributes(params[:manager])
      redirect_to :action => :show, :id => @manager.id
    else
      render 'edit'
    end
  end

end
