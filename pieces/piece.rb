class Piece 
  attr_reader :color, board 
  attr_accessor :pos

  def initialize(color, board, pos) 
    raise 'invalid color' unless %i(white black).include?(color)
    raise 'invalid pos' unless board.valid_pos?(pos)

    @color, @board, @pos = color, board, pos 
    board.add_piece(self, pos) 
  end 

  def to_s 
    " #{symbol} " 
  end 

  def empty? 
    false 
  end 

  def symbol
    raise NotImplementedError 
  end 

  def valid_moves 
    moves.reject { |end_pos| move_into_check?(end_pos) }
  end 

  def move_into_check?(end_pos) 
    test_board = board.dup 
    test_board = board.move_piece!(pos, end_pos) 
    test_board.in_check?(color) 
  end 
end 