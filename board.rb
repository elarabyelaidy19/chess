require_relative 'pieces' 
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

  def move_piece(turn_color, start_pos, end_pos)
    raise 'start position is empty' if empty?(start_pos)

    piece = self[start_pos]
    if piece.color != turn_color
      raise 'You must move your own piece'
    elsif !piece.moves.include?(end_pos)
      raise 'Piece does not move like that'
    elsif !piece.valid_moves.include?(end_pos)
      raise 'You cannot move into check'
    end

    move_piece!(start_pos, end_pos)
  end

  # move without performing checks
  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    raise 'piece cannot move like that' unless piece.moves.include?(end_pos)

    self[end_pos] = piece
    self[start_pos] = sentinel
    piece.pos = end_pos

    nil
  end



