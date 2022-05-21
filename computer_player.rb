class Computer_player
  def select_random_colors
    colors = []
    4.times { |i| colors[i] = rand(0..3) }
    colors
  end

  def guess_code
    select_random_colors
  end
end
