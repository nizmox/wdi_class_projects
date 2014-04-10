# There once was a wise servant who saved the life of a prince. The king promised to pay whatever the servant could dream up. Knowing that the king loved chess, the servant told the king he would like to have grains of wheat. One grain on the first square of a chess board. Two grains on the next. Four on the third, and so on.

# There are 64 squares on a chessboard.

# Write a program that shows

# how many grains were on each square, and
# the total number of grains

#1, 2, 4, 8, 16, 32

require 'pry'

class GrainCounter
  def initialize(squares)
    @squares = squares
  end

  def count_grains 
    value = 1
    total = 0

    @squares.times do
      puts value
      total += value
      value = value * 2
    end

    puts "Total: #{total}"
  end

end

g1 = GrainCounter.new(64)
g2 = GrainCounter.new(8)

binding.pry