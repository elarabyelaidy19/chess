class Piece 
  attr_reader :color, board 
  attr_accessor :pos

  def initialize(color, board, pos) 
    @color, @board, @pos = color, board, pos 
  end 