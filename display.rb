require './game'

class Display
  attr_reader :game_colors

  def initialize(game_colors)
    @game_colors = game_colors
  end

  def print_secret_code(selected_colors)
    p '-----------------------------------'
    puts 'Chosen code:'
    print_colors(selected_colors)
    p '-----------------------------------'
  end

  def print_colors(_selected_colors)
    sc = _selected_colors
    p "#{game_colors[sc[0] - 1]}, #{game_colors[sc[1] - 1]}, #{game_colors[sc[2] - 1]}, #{game_colors[sc[3] - 1]}"
  end

  def print_guess(selected_colors)
    p '-----------------------------------'
    puts 'Guess:'
    print_colors(selected_colors)
    p '-----------------------------------'
  end

  def codemaker_or_codebreaker_screen
    puts 'Which role do you want to play today?'
    puts '1. Codemaker'
    puts '2. Codebreaker'
    print 'Please enter your choice: '
  end

  def choose_colors_screen
    puts 'Please choose 4 different colors from the list below'
    puts "1. #{game_colors[0]}, 2. #{game_colors[1]}, 3. #{game_colors[2]}"
    puts "4. #{game_colors[3]}, 5. #{game_colors[4]}, 6. #{game_colors[5]}"
  end
end
