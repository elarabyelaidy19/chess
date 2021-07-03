






  def notify_players 
    if board.in_check?(current_player) 
      display.set_check! 
    else 
      display.uncheck! 
    end 
  end 
