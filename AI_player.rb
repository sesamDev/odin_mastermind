class AI_player
  @@guesses_taken = 0
  def choose_colors
    case @@guesses_taken
    when 0
      rand(0..3)
    end
  end
end
