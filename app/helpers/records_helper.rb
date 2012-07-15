module RecordsHelper
  
  def seqfinder(sql,type)

    seq = 0
    seq_home = 0
    seq_away = 0
    seq_start = ""
    
    seq_best = 0
    seq_home_best = 0
    seq_away_best = 0
    seq_start_best = ""
    seq_end_best = ""
    
    last_match_number = 0
    last_match_date = ""
    
    matches = Match.find_by_sql(sql + " ORDER BY id ASC")
    matches.each do |x|
      
      if type == "C"
        key = x.id
      else
        key = x.league_seq
      end
      
      if seq == 0
        
        seq = 1
        seq_start = x.matchdate
        last_match_number = key
        last_match_date = x.matchdate
        
        else
          
        if key - last_match_number == 1
          # sequence is continuing
          seq = seq + 1
          
          if x.han == "H"
            seq_home = seq_home + 1
          end
          
          if x.han == "A"
            seq_away = seq_away + 1
          end
          
        else
          # sequence has ended
          if seq > seq_best
            seq_best = seq
            seq_home_best = seq_home
            seq_away_best = seq_away            
            seq_start_best = seq_start
            seq_end_best = last_match_date
          end
      
          seq = 1
          seq_start = x.matchdate
          last_match_number = key
          last_match_date = x.matchdate

          if x.han == "H"
            seq_home = 1
            seq_away = 0
          end
          
          if x.han == "A"
            seq_away = 1
            seq_home = 0
          end

        end
  
        last_match_number = key
        last_match_date = x.matchdate
  
      end
    end
    
    if type == "H"
      seq_best = seq_best - seq_away_best
    end
    
    if type == "A"
      seq_best = seq_best - seq_home_best
    end
    
    return seq_start_best,seq_end_best,seq_best
  
  end
  
end
