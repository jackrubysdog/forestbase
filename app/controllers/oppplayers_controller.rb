class OppplayersController < ApplicationController

  def show
    
    @oppplayer = Oppplayer.find_by_id(params[:id])         
    @title = "Nottingham Forest - " + @oppplayer.knownname
    sql = "SELECT * FROM (SELECT 1 as on, off, match_id FROM oppappearances WHERE oppplayer_id=" + params[:id] +
      " UNION SELECT \"on\", off, match_id from oppsubstitutes WHERE oppplayer_id=" + params[:id] + ") AS foo INNER JOIN
      matches ON matches.id=foo.match_id ORDER BY matches.id"
    @matches = Match.find_by_sql(sql)
    
  end

  def edit
    
    @oppplayer = Oppplayer.find(params[:id])
    @title = "Nottingham Forest - " + @oppplayer.knownname + " - Edit"    
    
  end

  def update
  
    @oppplayer = Oppplayer.find(params[:id])
 
    if @oppplayer.update_attributes(params[:oppplayer])
      redirect_to :action => :show, :id => @oppplayer.id
    else
      render 'edit'
    end
  
  end
  
end
