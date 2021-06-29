
class Board 

  attr_reader :rows 

  def initialize(fill_board = true) 
    @sentinel = NullPiece.instance 
    make_starting_grid(fill_board) 
  end 
  
  def [](pos) 

    row, col = pos 
    @rows[row][col]
  end 

  