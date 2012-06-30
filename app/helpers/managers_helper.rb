module ManagersHelper
  
  def managerenddate(enddate)
    if enddate.to_time > Time.now
      "Current"
    else
      enddate
    end
  end
  
  def managertype(parm)
    case parm
    when "F" then "Manager"
    when "S" then "Secretary Manager"
    when "C" then "Caretaker"
    end
  end  
  
end
