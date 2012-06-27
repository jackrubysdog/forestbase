class SeasonRecord < ActiveRecord::Base
  
  def initialize(id)
    @id = id
  end
  
  def played
    @played = Match.count(:conditions => ['competition_id = 1 AND season_id = ?', @id])
  end
  
  def won
    @won = Match.count(:conditions => ['competition_id = 1 AND f > a AND season_id = ?', @id])
  end
  
  def drawn
    @drawn = Match.count(:conditions => ['competition_id = 1 AND f = a AND season_id = ?', @id])
  end
  
  def lost
    @lost = Match.count(:conditions => ['competition_id = 1 AND f < a AND season_id = ?', @id])
  end
  
  def f
    @f = Match.sum('f', :conditions => ['competition_id = 1 AND season_id = ?', @id])
  end  

  def a
    @a = Match.sum('a', :conditions => ['competition_id = 1 AND season_id = ?', @id])
  end
  
  def points
      if @id > 92
        @points = 3
      else
        @points = 2     
      end
    end
    
  def finalposition
    position = Match.last(:conditions => ['competition_id = 1 AND season_id = ?', @id])
    if position.nil?
      @finalposition = 0
    else
      @finalposition = position.position.ordinalize
    end
  end
  
  def facupround
    round = Match.last(:conditions => ['competition_id = 3 AND season_id = ?', @id])
    if round.nil?
      @facuprecord = ["0",0,0]
    else
      @facupround = [round.round, round.f, round.a]
    end
  end

  def leaguecupround
    round = Match.last(:conditions => ['competition_id = 2 AND season_id = ?', @id])
    if round.nil?
      @leaguecupround = ["0",0,0]
    else
      @leaguecupround = [round.round, round.f, round.a]
    end
  end
  
  def othercupround
    round = Match.last(:conditions => ['competition_id > 3 AND season_id = ?', @id])
    if round.nil?
      @othercupround = ["0","0",0,0]
    else
      @othercupround = [round.round, round.competition.abbrev, round.f, round.a]
    end
  end
  
  end