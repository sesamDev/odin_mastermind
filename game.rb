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
    p 'Game over, the code was cracked!'
    exit
  end

  def compare_guess_with_secret_colors(guess)
    secret = board.secret
    checked_guess = check_color_and_position(guess, secret)
    num_of_correct = check_only_colors(checked_guess[0], checked_guess[1])
    keys = checked_guess[2]
    num_of_correct.values.sum.times { keys.push('WK') }
    p keys
    board.place_keys(keys)
  end

  # def award_keys(correct_col_pos, correct_col)
  #   colored_key = Array.new()
  # end

  def check_color_and_position(guess, secret)
    checked_guess = [[], [], []]
    correct_guess = 0
    guess.each_index do |i|
      if guess[i] == secret[i]
        puts "Guess nr #{i + 1}, #{guess[i]} was correct, have a colored key"
        correct_guess += 1
        checked_guess[2].push('CK')
      else
        checked_guess[0].push(guess[i]) && checked_guess[1].push(secret[i])
      end
    end
    correct_guess == 4 ? game_over : checked_guess
  end

  def check_only_colors(guess, secret)
    num_of_correct = {}
    guess.each_with_index do |l, _i|
      num_of_correct[l] = guess.count(l) <= secret.count(l) ? guess.count(l) : next
    end
    puts "These colors are in the code, #{num_of_correct}, but your position was wrong , have white keys."
    num_of_correct
  end
end

# Take the latest guess of four colors, loop through secret colors, does

# the secret contain the color of the guess? How many instances of that color?
# TODO NR2, check if the colors are in the correct place.

game = Game.new
game.start_game

# # game.guess_secret_color until game.game_over
# game.start_game
