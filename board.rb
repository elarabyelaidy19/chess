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

  def checkmate?(color) 
    return false unless in_check?(color) 

    pieces.select { |p| p.color == color }.all? do |piece| 
      piece.valid_moves.empty? 
    end  
  end 

  def empty?(pos)
    self[pos].empty? 
  end 

  def dup 
    new_board = Board.new(false) 
    pieces.each do |piece|  
      piece.class.new(piece.color, new_board, piecepos) 
    end 
    new_board
  end 


  def in_check?(color) 
    king_pos = find_king(color).pos 
    pieces.any? do |p| 
      p.color != color && p.moves.include?(king_pos) 
    end 
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

  def move_piece!(start_pos, end_pos) 
    piece = self[start_pos] 
    raise 'piece cannot move like that' unless piece.moves.include?(end_pos) 

    self[end_pos] = piece 
    self[start_pos] = sentinel 
    piece.pos = end_pos 
    nil 
  end 

  def pieces 
    @rows.flatten.reject(&:empty) 
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

  def valid_pos?(pos) 
    pos.all? { |coord| coord.between?(0, 7) } 
  end 



