class PlayerRecord < ActiveRecord::Base
  
  def initialize(id)
    @player_id = id
  end
  
  def firstgame
    appdebut = Appearance.find(:first,:joins=>:match,:conditions=>{:appearances=>{:player_id=>@player_id}})
    subdebut = Substitute.find(:first,:joins=>:match,:conditions=>{:substitutes=>{:player_id=>@player_id}})
    
    if appdebut.nil?
      @firstgame = subdebut.match.matchdate
    elsif subdebut.nil?
      @firstgame = appdebut.match.matchdate
    elsif appdebut.match.matchdate < subdebut.match.matchdate
      @firstgame = appdebut.match.matchdate
    else
      @firstgame = subdebut.match.matchdate
    end
  end

  def lastgame
    applast = Appearance.find(:last,:joins=>:match,:conditions=>{:appearances=>{:player_id=>@player_id}})
    sublast = Substitute.find(:last,:joins=>:match,:conditions=>{:substitutes=>{:player_id=>@player_id}})
    
    if applast.nil?
      @lastgame = sublast.match.matchdate
    elsif sublast.nil?
      @lastgame = applast.match.matchdate
    elsif applast.match.matchdate > sublast.match.matchdate
      @lastgame = applast.match.matchdate
    else
      @lastgame = sublast.match.matchdate
    end
  end

  def position
    @position = Player.find_by_id(@player_id).position
  end
  
  def leagueapps
    @leagueapps = Appearance.count(:all,:joins=>:match,:conditions=>{:appearances=>{:player_id=>@player_id},:matches=>{:competition_id=>1}}) 
  end
  
  def leaguesubs
    @leaguesubs = Substitute.count(:all,:joins=>:match,:conditions=>{:substitutes=>{:player_id=>@player_id},:matches=>{:competition_id=>1}}) 
  end

  def leaguegoals
    @leaguegoals = Goal.count(:all,:joins=>:match,:conditions=>{:goals=>{:player_id=>@player_id},:matches=>{:competition_id=>1}}) 
  end
  
  def leaguecupapps
    @leaguecupapps = Appearance.count(:all,:joins=>:match,:conditions=>{:appearances=>{:player_id=>@player_id},:matches=>{:competition_id=>2}}) 
  end
  
  def leaguecupsubs
    @leaguecupsubs = Substitute.count(:all,:joins=>:match,:conditions=>{:substitutes=>{:player_id=>@player_id},:matches=>{:competition_id=>2}}) 
  end

  def leaguecupgoals
    @leaguecupgoals = Goal.count(:all,:joins=>:match,:conditions=>{:goals=>{:player_id=>@player_id},:matches=>{:competition_id=>2}}) 
  end

  def facupapps
    @facupapps = Appearance.count(:all,:joins=>:match,:conditions=>{:appearances=>{:player_id=>@player_id},:matches=>{:competition_id=>3}}) 
  end
  
  def facupsubs
    @facupsubs = Substitute.count(:all,:joins=>:match,:conditions=>{:substitutes=>{:player_id=>@player_id},:matches=>{:competition_id=>3}}) 
  end

  def facupgoals
    @facupgoals = Goal.count(:all,:joins=>:match,:conditions=>{:goals=>{:player_id=>@player_id},:matches=>{:competition_id=>3}}) 
  end

  def othercupapps
    @othercupapps = Appearance.joins(:match).where("appearances.player_id=? AND matches.competition_id>3",@player_id).count 
  end
  
  def othercupsubs
    @othercupsubs = Substitute.joins(:match).where("substitutes.player_id=? AND matches.competition_id>3",@player_id).count 
  end

  def othercupgoals
    @othercupgoals = Goal.joins(:match).where("goals.player_id=? AND matches.competition_id>3",@player_id).count 
  end
    
  def careerapps
    @careerapps = Appearance.joins(:match).where("appearances.player_id=?",@player_id).count 
  end
  
  def careersubs
    @careersubs = Substitute.joins(:match).where("substitutes.player_id=?",@player_id).count 
  end

  def careergoals
    @careergoals = Goal.joins(:match).where("goals.player_id=?",@player_id).count 
  end
    
  end
