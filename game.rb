require './display'
require './computer_player'

class Game
  attr_accessor :computer_player, :display

  @@game_colors = %w[Red Green Blue Yellow Orange Purple]
  @@round = 0
  @@MAX_ROUNDS = 12

  def initialize
    @display = Display.new(@@game_colors)
    @computer_player = Computer_player.new
  end

  def choose_colors
    gets.chop.split('').map(&:to_i)
  end

  def choose_codemaker_or_codebreaker
    gets.chop.to_i == 1 ? 'Codemaker' : 'Codebreaker'
  end

  def decode(play_mode)
    while @@round < @@MAX_ROUNDS
      guess = if play_mode == 'Codemaker'
                sleep 1
                computer_player.guess_code
              else
                choose_colors
              end
      @@round += 1
      display.print_guess(guess)
    end
  end

  def run
    display.codemaker_or_codebreaker_screen
    play_mode = choose_codemaker_or_codebreaker
    if play_mode == 'Codemaker'
      display.choose_colors_screen
      code = choose_colors
      display.print_secret_code(code)
    else
      p code = computer_player.select_random_colors
      display.choose_colors_screen
    end
    guess = decode(play_mode)
    display.print_guess(guess)
  end
end
