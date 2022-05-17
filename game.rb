require './board'
require './player'
require './AI_player'
require 'pry-byebug'

class Game
  @@NUM_OF_GUESSES = 12

  attr_accessor :board, :player, :ai_player

  def initialize
    create_player
    @ai_player = AI_player.new
    @board = Board.new
  end

  def start_game
    @@game_mode_for_player = decode_or_set_code?
    @@game_mode_for_player == 'Secret' ? select_secret_colors : play_as_guesser
    play_as_guesser # Will trigger AI to play as guesser
  end

  def play_as_guesser
    current_guess = 0
    while current_guess < @@NUM_OF_GUESSES
      compare_guess_with_secret_colors(guess_secret_color)
      current_guess += 1
    end
  end

  def create_player
    puts 'Welcome to my Mastermind clone, what\'s your name?'
    @player = Player.new(gets.chomp)
  end

  def decode_or_set_code?
    puts 'Would you like to set the code or do you want to be the gusser?'
    puts 'Press 1 for setting code'
    puts 'Press 2 for being the codecracker'

    p gets.chop == '1' ? 'Secret' : 'Guesser'
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

  @@is_secret_color_set = false
  def select_colors
    chosen_colors = []
    possible_colors = %w[Red Green Blue Purple Orange Yellow]
    4.times do
      puts 'Choose one of the following colors by entering the number next to it.'
      puts "1. #{possible_colors[0]}, 2. #{possible_colors[1]}, 3. #{possible_colors[2]}"
      puts "4. #{possible_colors[3]}, 5. #{possible_colors[4]}, 6. #{possible_colors[5]}"
      color = if @@game_mode_for_player == 'Secret' && !@@is_secret_color_set
                possible_colors[gets.to_i - 1]
              elsif @@game_mode_for_player == 'Secret' && @@is_secret_color_set
                possible_colors[ai_player.choose_colors]
              end
      chosen_colors.push(color)
    end
    @@is_secret_color_set = true
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
    sleep 2
    board.place_keys(keys)
  end

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

game = Game.new
game.start_game
