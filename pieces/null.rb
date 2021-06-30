require "singleton" 
require_relative "piece" 

class NullPiece < Piece  
  attr_reader :symbol 
  include singleton 
  
  def initialize 
    @symbol = " " 
    @color = :none 
  end 

  def empty? 
    true 
  end 

  def moves 
    [] 
  end 

end 