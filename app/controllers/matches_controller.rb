class MatchesController < ApplicationController
    
  def show
    @match = Match.find_by_id(params[:id])
    @title = "Nottingham Forest - " + @match.matchdate.to_s + " v " + opponentname(@match.opponent.id,@match.season.id) + " (" + @match.han + ")" 
  end

  def edit
    @match = Match.find_by_id(params[:id])    
 
    (3-@match.substitutes.count).times do
      @match.substitutes.build
    end

    (3-@match.oppsubstitutes.count).times do
      @match.oppsubstitutes.build
    end

    (8-@match.goals.count).times do
      @match.goals.build
    end

    (8-@match.oppgoals.count).times do
      @match.oppgoals.build
    end

    (3-@match.owngoals.count).times do
      @match.owngoals.build
    end

    (3-@match.oppowngoals.count).times do
      @match.oppowngoals.build
    end
    
    @title = "Nottingham Forest - " + @match.matchdate.to_s + " v " + opponentname(@match.opponent.id,@match.season.id) + " (" + @match.han + ") - Edit" 
  end

  def update

    @match = Match.find(params[:id])
 
    if @match.update_attributes(params[:match])

      @forestsubs = Substitute.find_all_by_match_id(params[:id])
      @forestsubs.each do |x|
        timeon = Appearance.first(:conditions => ["match_id = ? AND subbedby = ?",params[:id],x.shirt])
        if timeon.blank?
          timeon = Substitute.first(:conditions => ["match_id = ? AND subbedby = ?",params[:id],x.shirt])          
        end
        x.update_attributes(:on => timeon.off)     
      end

      @oppsubs = Oppsubstitute.find_all_by_match_id(params[:id])
      @oppsubs.each do |x|
        timeon = Oppappearance.first(:conditions => ["match_id = ? AND subbedby = ?",params[:id],x.shirt])
        if timeon.blank?
          timeon = Oppsubstitute.first(:conditions => ["match_id = ? AND subbedby = ?",params[:id],x.shirt])          
        end
        x.update_attributes(:on => timeon.off)     
      end
      
      redirect_to :action => :show, :id => @match.id
    else
      render 'edit'
    end

  end
end
