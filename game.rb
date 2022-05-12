require "./board.rb"

class Game
  def initialize
    @board = Board.new
  end
  attr_accessor :board

  def guess
    chosen_colors = []
    possible_colors = %w[Red Green Blue Purple Orange Yellow]
    4.times do
      puts 'Choose one of the following colors by entering the number next to it.'
      puts "1. #{possible_colors[0]}, 2. #{possible_colors[1]}, 3. #{possible_colors[2]}"
      puts "4. #{possible_colors[3]}, 5. #{possible_colors[4]}, 6. #{possible_colors[5]}"
      color = possible_colors[gets.to_i - 1]
      chosen_colors.push(color)
    end
    board.place_guess(chosen_colors)
    chosen_colors.clear
  end

  def game_over
    false
  end
end

game = Game.new

game.guess until game.game_over
