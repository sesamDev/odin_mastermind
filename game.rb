require './board'
require 'pry-byebug'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def start_game
    select_secret_colors
    compare_guess_with_secret_colors(guess_secret_color)
  end

  def guess_secret_color
    puts 'Guess the secret colors!'
    guess = select_colors
    board.place_guess(guess)
    guess
  end

  def select_secret_colors
    puts 'Select your secret colors.'
    selection = select_colors
    board.place_secret_colors(selection)
  end

  def select_colors
    chosen_colors = []
    possible_colors = %w[Red Green Blue Purple Orange Yellow]
    4.times do
      puts 'Choose one of the following colors by entering the number next to it.'
      puts "1. #{possible_colors[0]}, 2. #{possible_colors[1]}, 3. #{possible_colors[2]}"
      puts "4. #{possible_colors[3]}, 5. #{possible_colors[4]}, 6. #{possible_colors[5]}"
      color = possible_colors[gets.to_i - 1]
      chosen_colors.push(color)
    end
    chosen_colors
  end

  def game_over
    false
  end

  def compare_guess_with_secret_colors(guess)
    secret = board.secret
    check_color_and_position(guess, secret)
    check_only_colors(guess, secret)
  end

  def check_color_and_position(guess, secret)
    guess.each_index { |i| p guess[i] == secret[i] }
  end

  def check_only_colors(guess, secret)
    num_of_correct = {}
    guess.each_with_index do |l, _i|
      num_of_correct[l] = guess.count(l) <= secret.count(l) ? guess.count(l) : next
    end
    p num_of_correct
  end
end

# Take the latest guess of four colors, loop through secret colors, does

# the secret contain the color of the guess? How many instances of that color?
# TODO NR2, check if the colors are in the correct place.

game = Game.new
game.start_game

# # game.guess_secret_color until game.game_over
# game.start_game
