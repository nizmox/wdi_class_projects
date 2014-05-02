# Difference of Sums of Squares
# The sum of the squares of the first ten natural numbers is,

# 1**2 + 2**2 + ... + 10**2 = 385

# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)**2 = 55**2 = 3025

# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

require 'pry'

class SoS

  def initialize(range)
    @range = range
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private
  def sum_of_squares
    # @range.inject{|sum,n| sum + n ** 2}
    sum = 0
    @range.to_a.each do |num|
      sum += num ** 2
    end
    sum
  end

  def square_of_sum
    sum = @range.inject(:+)
    sum ** 2
  end
end

s1 = SoS.new(1..10)
s2 = SoS.new(1..100)

binding.pry