class Board
  def initialize
    @blank = Array.new(47, '     ')
    @secret = %w[blue red green purple]
    print_board
  end
  attr_accessor :blank, :secret

  def print_board
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[0]}|#{blank[1]}|#{blank[2]}|#{blank[3]}| Row: 12|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[4]}|#{blank[5]}|#{blank[6]}|#{blank[7]}| Row: 11|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[8]}|#{blank[9]}|#{blank[10]}|#{blank[11]}| Row: 10|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[12]}|#{blank[13]}|#{blank[14]}|#{blank[15]}| Row: 9|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[16]}|#{blank[17]}|#{blank[18]}|#{blank[19]}| Row: 8|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[20]}|#{blank[21]}|#{blank[22]}|#{blank[23]}| Row: 7|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[24]}|#{blank[25]}|#{blank[26]}|#{blank[27]}| Row: 6|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[28]}|#{blank[29]}|#{blank[30]}|#{blank[31]}| Row: 5|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[32]}|#{blank[33]}|#{blank[34]}|#{blank[35]}| Row: 4|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[36]}|#{blank[37]}|#{blank[38]}|#{blank[39]}| Row: 3|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[40]}|#{blank[41]}|#{blank[42]}|#{blank[43]}| Row: 2|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|WP|BP|#{blank[44]}|#{blank[45]}|#{blank[46]}|#{blank[47]}| Row: 1|"
    puts "|--|--|"
    puts "__________________________________________________"
    puts "|Secret|#{secret[0]}|#{secret[1]}|#{secret[2]}|#{secret[3]}|Secret|"
  end

  @board_slot = 0

  def place_guess(guess)
    guess_number = 0
    4.times do
      blank[@@board_slot] = guess[guess_number]
      guess_number += 1
      @board_slot += 1
    end
    print_board
  end
end
