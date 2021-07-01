require "colorize" 
require_relative "cursor" 

class Display 

  attr_reader :board, :notifications, :cursor 

  def initialize(board) 
    @board = board 
    @cursor = Cursor.new([0, 0], board)  
    @notifications = {} 
  end 

  def render 
    system("clear") 
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join } 

    @notifications.each do |_key, val| 
      pust val 
    end 
  end 
end 



