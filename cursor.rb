require "io/console"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}.freeze

MOVES = { 
  left: [0, -1], 
  right: [0, 1], 
  up: [-1, 0],
  down: [1, 0]
}.freeze

}

class Cursor 
  attr_reader : cursor_pos, :board, :selected 

  def initialize(cursor_pos, board) 
    @cursor_pos = cursor_pos 
    @board = board 
    @selected = selected 
  end 

  def get_input 
    key KEYMAP[read_char] 
    handle_key(key) 
  end 


