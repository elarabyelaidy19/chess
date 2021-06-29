module Slideable 

  HORIZONTAL_AND_VERTICAL_DIRS [ 
    [-1, 0], 
    [0, -1],
    [0, 1, 
    [1, 0] 
  ].freeze 
  
  DIAGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ].freeze

  def horizontal_and_vertical_dirs
    HORIZONTAL_AND_VERTICAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves

    moves = [] 
    move_dirs.each do |d_x, d_y| 
      moves.concat(grow_unblocked_moves_in_dir(dx, dy)) 
    end 
    moves 
  end 

  def move_dirs 
    raise NotImplementedError 
  end 
