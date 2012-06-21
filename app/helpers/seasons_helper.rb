module SeasonsHelper
  
  def tier_roman(tier)
    case tier
    when 0 then "-"
    when 1 then "I"
    when 2 then "II"
    when 3 then "III"
    end
  end
  
end