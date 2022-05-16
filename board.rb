require 'pry-byebug'
class Board
  attr_accessor :blank, :secret, :keys

  def initialize
    @blank = Array.new(47, '     ')
    @secret = []
    @keys = Array.new(47, '--')
    print_board
  end

  def print_board
    puts '__________________________________________________'
    puts "|#{keys[0]}|#{keys[1]}|#{blank[0]}|#{blank[1]}|#{blank[2]}|#{blank[3]}| Row: 12|"
    puts "|#{keys[2]}|#{keys[3]}|"
    puts '__________________________________________________'
    puts "|#{keys[4]}|#{keys[5]}|#{blank[4]}|#{blank[5]}|#{blank[6]}|#{blank[7]}| Row: 11|"
    puts "|#{keys[6]}|#{keys[7]}|"
    puts '__________________________________________________'
    puts "|#{keys[8]}|#{keys[9]}|#{blank[8]}|#{blank[9]}|#{blank[10]}|#{blank[11]}| Row: 10|"
    puts "|#{keys[10]}|#{keys[11]}|"
    puts '__________________________________________________'
    puts "|#{keys[12]}|#{keys[13]}|#{blank[12]}|#{blank[13]}|#{blank[14]}|#{blank[15]}| Row: 9|"
    puts "|#{keys[14]}|#{keys[15]}|"
    puts '__________________________________________________'
    puts "|#{keys[16]}|#{keys[17]}|#{blank[16]}|#{blank[17]}|#{blank[18]}|#{blank[19]}| Row: 8|"
    puts "|#{keys[18]}|#{keys[19]}|"
    puts '__________________________________________________'
    puts "|#{keys[20]}|#{keys[21]}|#{blank[20]}|#{blank[21]}|#{blank[22]}|#{blank[23]}| Row: 7|"
    puts "|#{keys[22]}|#{keys[23]}|"
    puts '__________________________________________________'
    puts "|#{keys[24]}|#{keys[25]}|#{blank[24]}|#{blank[25]}|#{blank[26]}|#{blank[27]}| Row: 6|"
    puts "|#{keys[26]}|#{keys[27]}|"
    puts '__________________________________________________'
    puts "|#{keys[28]}|#{keys[29]}|#{blank[28]}|#{blank[29]}|#{blank[30]}|#{blank[31]}| Row: 5|"
    puts "|#{keys[30]}|#{keys[31]}|"
    puts '__________________________________________________'
    puts "|#{keys[32]}|#{keys[33]}|#{blank[32]}|#{blank[33]}|#{blank[34]}|#{blank[35]}| Row: 4|"
    puts "|#{keys[34]}|#{keys[35]}|"
    puts '__________________________________________________'
    puts "|#{keys[36]}|#{keys[37]}|#{blank[36]}|#{blank[37]}|#{blank[38]}|#{blank[39]}| Row: 3|"
    puts "|#{keys[38]}|#{keys[39]}|"
    puts '__________________________________________________'
    puts "|#{keys[40]}|#{keys[41]}|#{blank[40]}|#{blank[41]}|#{blank[42]}|#{blank[43]}| Row: 2|"
    puts "|#{keys[42]}|#{keys[43]}|"
    puts '__________________________________________________'
    puts "|#{keys[44]}|#{keys[45]}|#{blank[44]}|#{blank[45]}|#{blank[46]}|#{blank[47]}| Row: 1|"
    puts "|#{keys[46]}|#{keys[47]}|"
    puts '__________________________________________________'
    puts "|Secret|#{secret[0]}|#{secret[1]}|#{secret[2]}|#{secret[3]}|Secret|"
    puts '|      |'
    puts '__________________________________________________'
  end

  @@board_slot = 0
  def place_guess(guess)
    guess_number = 0
    4.times do
      @blank[@@board_slot] = guess[guess_number]
      guess_number += 1
      @@board_slot += 1
    end
    print_board
  end

  @@key_slot = 0
  def place_keys(recieved_keys)
    key_number = 0
    4.times do
      @keys[@@key_slot] = recieved_keys[key_number]
      key_number += 1
      @@key_slot += 1
    end
    print_board
  end

  def place_secret_colors(selection)
    index = 0
    4.times do
      secret[index] = selection[index]
      index += 1
    end
    print_board
  end
end

board = Board.new
p board.secret
