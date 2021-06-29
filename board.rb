
class Board 

  attr_reader :rows 

  def initialize(fill_board = true) 
    @sentinel = NullPiece.instance 
    make_starting_grid(fill_board) 
  end 
  
  def [](pos) 
    raise "invalid position" unless valid_pos?(pos)

    row, col = pos 
    @rows[row][col]
  end 

  def [](pos, piece) 
    raise "invalid position" unless valid_pos?(pos)
    row, col = pos 
    @row[row][col] = piece 
  end 

  def add_piece(pos, piece) 
    raise 'position not empty' unless empty?(pos) 
    self[pos] = piece 
  end 

