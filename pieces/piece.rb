class Piece 
  attr_reader :color, board 
  attr_accessor :pos

  def initialize(color, board, pos) 

    @color, @board, @pos = color, board, pos 
    board.add_piece(self, pos) 
  end 

  def to_s 
    " #{symbol} " 
  end 