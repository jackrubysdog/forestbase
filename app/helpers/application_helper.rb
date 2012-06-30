module ApplicationHelper
 
  def active_check(title)
    if title == @title
      raw "<li class='active'>"
      elsif title == @title[@title.length-7,@title.length]
        raw "<li class='active'>"
      else
         raw "<li>"
    end
  end

  def checkdeath(parm)
    if parm.to_s[6,11] = "01 Jan" 
      parm.strftime("%Y")
    else
      parm.strftime("%B %d, %Y")
    end
  end
  
  def checkforempty(parm)
    if parm.empty?
      "-"
    else
      parm
    end
  end
  
  def checkforzero(parm)
    if parm == 0
      "-"
    else
      parm.to_s
    end
  end

  def checkforzeroslashone(parm,clubs)
    if parm == 0
      "-"
    else
      parm.to_s + "/" + clubs.to_s
    end
  end
  
  def constructyears(id,first,last)
    temp = Player.find_by_id(id)
    if temp.datesignedsecondspell.nil?
      ast = ""
    else
      ast = "*"
    end
    if first == last
      first.to_s + ast
    else
      first.to_s + "-" + last.to_s + ast
    end
  end

  def constructgoalscorersstring(id)
    round = Goal.first(:conditions => ['time IS NOT NULL'])
    firstmatchwithgoaltime = round.match_id
    @scorers = Goal.find_all_by_match_id(id)
    temp = Array.new{Array.new}
    idx = 0
    @scorers.each do |x|
      link = "<a href='/players/" + x.player.id.to_s + "'>" + x.player.shortname + "</a>"
      if firstmatchwithgoaltime < id
        temp << [link,x.time.to_s,x.time]
      else
        temp << [link,"1",0]
      end
      if x.penalty == 1
        temp[idx][1] = temp[idx][1] + "p"
      end
      idx += 1
    end
    @owngoals = Oppowngoal.find_all_by_match_id(id)
    @owngoals.each do |x|
      if firstmatchwithgoaltime < id
        temp << [x.oppplayer.shortname,x.time.to_s + "og",x.time]
      else
        temp << [x.oppplayer.shortname,"og",0]
      end
      idx += 1
      end
    if idx == 0
      raw "&nbsp"
      else
      if firstmatchwithgoaltime < id
        temp = temp.sort_by{|x|x[2]}
      end
      scorerstring = ""
      goals = idx
      idx = 0
      while idx < goals
        check_idx = idx + 1
        while check_idx < goals
          if temp[check_idx][0] != "{null}"
            if temp[check_idx][0] == temp[idx][0]
              temp[check_idx][0] = "{null}"
              if firstmatchwithgoaltime < id
                temp[idx][1] = temp[idx][1] + ", " + temp[check_idx][1]
              else
                temp[idx][1] = temp[idx][1].to_i + 1  
                temp[idx][1] = temp[idx][1].to_s  
              end
            end
          end
        check_idx += 1
        end
      idx += 1  
      end
      idx = 0
      while idx < goals
        if temp[idx][0] != "{null}"
          if firstmatchwithgoaltime < id
            scorerstring = scorerstring + temp[idx][0] + " " + temp[idx][1] + ", "
          else
            if temp[idx][1] != "1"
              scorerstring = scorerstring + temp[idx][0] + " [" + temp[idx][1] + "], "
            else
              scorerstring = scorerstring + temp[idx][0] + ", "            
            end  
          end
        end
      idx += 1
      end
      return scorerstring[0,scorerstring.length-2]
    end
  end
    
  def constructoppgoalscorersstring(id)
    round = Oppgoal.first(:conditions => ['time IS NOT NULL'])
    firstmatchwithgoaltime = round.match_id
    @scorers = Oppgoal.find_all_by_match_id(id)
    temp = Array.new{Array.new}
    idx = 0
    @scorers.each do |x|
      link = "<a href='/oppplayers/" + x.oppplayer.id.to_s + "'>" + x.oppplayer.shortname + "</a>"
      if firstmatchwithgoaltime < id
        temp << [link,x.time.to_s,x.time]
      else
        temp << [link,"1",0]
      end
      if x.penalty == 1
        temp[idx][1] = temp[idx][1] + "p"
      end
      idx += 1
    end
    @owngoals = Owngoal.find_all_by_match_id(id)
    @owngoals.each do |x|
      if firstmatchwithgoaltime < id
        temp << [x.player.shortname,x.time.to_s + "og",x.time]
      else
        temp << [x.player.shortname,"og",0]
      end
      idx += 1
      end
    if idx == 0
      raw "&nbsp"
      else
      if firstmatchwithgoaltime < id
        temp = temp.sort_by{|x|x[2]}
      end
      scorerstring = ""
      goals = idx
      idx = 0
      while idx < goals
        check_idx = idx + 1
        while check_idx < goals
          if temp[check_idx][0] != "{null}"
            if temp[check_idx][0] == temp[idx][0]
              temp[check_idx][0] = "{null}"
              if firstmatchwithgoaltime < id
                temp[idx][1] = temp[idx][1] + ", " + temp[check_idx][1]
              else
                temp[idx][1] = temp[idx][1].to_i + 1  
                temp[idx][1] = temp[idx][1].to_s  
              end
            end
          end
        check_idx += 1
        end
      idx += 1  
      end
      idx = 0
      while idx < goals
        if temp[idx][0] != "{null}"
          if firstmatchwithgoaltime < id
            scorerstring = scorerstring + temp[idx][0] + " " + temp[idx][1] + ", "
          else
            if temp[idx][1] != "1"
              scorerstring = scorerstring + temp[idx][0] + " [" + temp[idx][1] + "], "
            else
              scorerstring = scorerstring + temp[idx][0] + ", "            
            end  
          end
        end
      idx += 1
      end
      return scorerstring[0,scorerstring.length-2]
    end
  end 
  
  def constructcompetition(competition,round,leg,replay)
    if competition == "LGE"
      ""
    elsif
      leg == 1
        " (" + competition + round + ":1L)"
    elsif
      leg == 2
        " (" + competition + round + ":2L)"
    elsif
      replay.nil?
        " (" + competition + round + ")"
    elsif
      replay == 1
        " (" + competition + round + " R)"
    else unless replay == 0
        " (" + competition + round + " " + replay.to_s + "R)"
    end
    end
  end
  
  def cuproundverbose(round,f,a)
    case round
    when "1" then "First Round"
    when "2" then "Second Round"
    when "3" then "Third Round"
    when "4" then "Fourth Round"
    when "5" then "Fifth Round"
    when "QF" then "Quarter-finals"
    when "SF" then "Semi-finals"
    when "F" then
      if f == 999
        "FINAL"
      elsif f > a 
        "WINNERS" 
        else
         "Runners-up"
      end
    else "-"
    end
  end
  
  def constructopponentfromdate(matchdate)
    x = Match.find_by_matchdate(matchdate)
    x.opponent.shortname + " " + constructcompetition(x.competition.abbrev,x.round,x.leg,x.replay)
  end
  
  def getvenuefromdate(matchdate)
    x = Match.find_by_matchdate(matchdate)
    "(" + x.han.downcase + ")"
  end
    
    
  def h5alternate(idx)
   if idx % 2 == 0
     raw "<h5 class='center'>"
     else
     raw "<h5 class='alternate_center'>"
   end
 end
  
 def h5alternate_left(idx)
   if idx % 2 == 0
     raw "<h5>"
     else
     raw "<h5 class='alternate'>"
   end
 end

def h5alternate_right(idx)
   if idx % 2 == 0
     raw "<h5 class='right'>"
     else
     raw "<h5 class='alternate_right'>"
   end
 end

def h5cupcheck(idx,competition,left)
  if competition == 1 and left == true
      h5alternate_left(idx)
  elsif competition == 1 and left == false
      h5alternate(idx)
  elsif left == true
    raw "<h5 class='cup_left'>"
  else
    raw "<h5 class='cup'>"
  end
end

def h5position(idx,position,clubs)
   if position == "1st"
     raw "<h5 class='gold'>"
   elsif
     position == "2nd"
     raw "<h5 class='silver'>"
   elsif
     position == "3rd"
     raw "<h5 class='bronze'>"
   elsif
     position == "24th" or position == "23rd" or position == "22nd"
     raw "<h5 class='relegated'>"
   elsif
     position == "21st" and clubs < 23
     raw "<h5 class='relegated'>"
   elsif
     position == "20th" and clubs < 22
     raw "<h5 class='relegated'>"
   elsif
     position == "19th" and clubs < 21
     raw "<h5 class='relegated'>"
   elsif idx % 2 == 0
     raw "<h5 class='center'>"
     else
     raw "<h5 class='alternate_center'>"
   end
 end

def h5round(idx,round)
   if round == "WINNERS"
     raw "<h5 class='gold'>"
   elsif
     round == "Runners-up"
     raw "<h5 class='silver'>"
   elsif idx % 2 == 0
     raw "<h5 class='center'>"
     else
     raw "<h5 class='alternate_center'>"
   end
 end
 
def homevenue(opponents,han)
  if han == "H"
    opponents.upcase
  else
    opponents

  end
end

def ordinalize(parm)
  suffix = "th"
  case parm
    when 1 then suffix = "st"
    when 2 then suffix = "nd" 
    when 3 then suffix = "rd" 
    when 21 then suffix = "st" 
    when 22 then suffix = "nd" 
    when 23 then suffix = "rd" 
  end
  parm = parm.to_s + suffix
end
  
def othercup(parm)
  if parm == "0"
    ""
  else
    parm + ": "
  end
end

def wld (f,a)
  if f > a
    "W"
  elsif f == a
    "D"
  else
    "L"
  end
end

end