require_relative 'board' 
require_relative 'human_player' 

class Game 
  attr_reader :board, :display, :current_player, :players 

  def initialize 
    @board = Board.new 
    @display = Display.new(@board) 
    @players = { 
      white: HumanPlayer.new(:white, @display), 
      black: HumanPlayer.new(:black, @display) 
    } 
    @current_player = :white 
  end 






  def notify_players 
    if board.in_check?(current_player) 
      display.set_check! 
    else 
      display.uncheck! 
    end 
  end 