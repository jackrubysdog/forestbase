class PlayerSeasonRecord < ActiveRecord::Base
  
  def initialize(season_id,player)
    @id = season_id
    @player_id = Player.find_by_name(player).id
    tmp = Match.find(:last,:conditions=>{:season_id=>@id})
    @lastmatch = tmp.id
  end
  
  def firstgame
    fulldebut = Appearance.find(:first,:joins=>:match,:conditions=>{:appearances=>{:player_id=>@player_id}})
    debut = Substiture.find(:first,:joins=>:match,:conditions=>{:appearances=>{:player_id=>@player_id}})
    if fulldebut.id < debut.id
      @firstgame = fulldebut
    else
      @firstgame = debut
    end
  end
  
  def position
    @position = Player.find_by_id(@player_id).position
  end
  
  def leagueapps
    @leagueapps = Appearance.count(:all,:joins=>:match,:conditions=>{:appearances=>{:player_id=>@player_id},:matches=>{:competition_id=>1,:season_id=>@id}}) 
  end
  
  def leaguesubs
    @leaguesubs = Substitute.count(:all,:joins=>:match,:conditions=>{:substitutes=>{:player_id=>@player_id},:matches=>{:competition_id=>1,:season_id=>@id}}) 
  end

  def leaguegoals
    @leaguegoals = Goal.count(:all,:joins=>:match,:conditions=>{:goals=>{:player_id=>@player_id},:matches=>{:competition_id=>1,:season_id=>@id}}) 
  end
  
  def leaguecupapps
    @leaguecupapps = Appearance.count(:all,:joins=>:match,:conditions=>{:appearances=>{:player_id=>@player_id},:matches=>{:competition_id=>2,:season_id=>@id}}) 
  end
  
  def leaguecupsubs
    @leaguecupsubs = Substitute.count(:all,:joins=>:match,:conditions=>{:substitutes=>{:player_id=>@player_id},:matches=>{:competition_id=>2,:season_id=>@id}}) 
  end

  def leaguecupgoals
    @leaguecupgoals = Goal.count(:all,:joins=>:match,:conditions=>{:goals=>{:player_id=>@player_id},:matches=>{:competition_id=>2,:season_id=>@id}}) 
  end

  def facupapps
    @facupapps = Appearance.count(:all,:joins=>:match,:conditions=>{:appearances=>{:player_id=>@player_id},:matches=>{:competition_id=>3,:season_id=>@id}}) 
  end
  
  def facupsubs
    @facupsubs = Substitute.count(:all,:joins=>:match,:conditions=>{:substitutes=>{:player_id=>@player_id},:matches=>{:competition_id=>3,:season_id=>@id}}) 
  end

  def facupgoals
    @facupgoals = Goal.count(:all,:joins=>:match,:conditions=>{:goals=>{:player_id=>@player_id},:matches=>{:competition_id=>3,:season_id=>@id}}) 
  end

  def othercupapps
    @othercupapps = Appearance.joins(:match).where("appearances.player_id=? AND matches.season_id=? AND matches.competition_id>3",@player_id,@id).count 
  end
  
  def othercupsubs
    @othercupsubs = Substitute.joins(:match).where("substitutes.player_id=? AND matches.season_id=? AND matches.competition_id>3",@player_id,@id).count 
  end

  def othercupgoals
    @othercupgoals = Goal.joins(:match).where("goals.player_id=? AND matches.season_id=? AND matches.competition_id>3",@player_id,@id).count 
  end

  def totalapps
    @totalapps = Appearance.joins(:match).where("appearances.player_id=? AND matches.season_id=?",@player_id,@id).count 
  end
  
  def totalsubs
    @totalsubs = Substitute.joins(:match).where("substitutes.player_id=? AND matches.season_id=?",@player_id,@id).count 
  end

  def totalgoals
    @totalgoals = Goal.joins(:match).where("goals.player_id=? AND matches.season_id=?",@player_id,@id).count 
  end
  
  def careerapps
    @careerapps = Appearance.joins(:match).where("appearances.player_id=? AND matches.id<=?",@player_id,@lastmatch).count 
  end
  
  def careersubs
    @careersubs = Substitute.joins(:match).where("substitutes.player_id=? AND matches.id<=?",@player_id,@lastmatch).count 
  end

  def careergoals
    @careergoalss = Goal.joins(:match).where("goals.player_id=? AND matches.id<=?",@player_id,@lastmatch).count 
  end

  end
