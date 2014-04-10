# Pling Plang Plong
# Write a program that converts a number to a string per the following rules:

# If the number contains 3 as a prime factor, output 'Pling'. If the number contains 5 as a prime factor, output 'Plang'. If the number contains 7 as a prime factor, output 'Plong'.

# If the number does not contain 3, 5, or 7 as a prime factor, simply return the string representation of the number itself.

# E.g.

# The prime factors of 28 are [2, 2, 7].

# drops = Raindrops.new.convert(28)
# # => "Plong"
# The prime factors of 1755 are [3, 3, 3, 5, 13].

# drops = Raindrops.new.convert(1755)
# # => "PlingPlang"
# The prime factors of 34 are [2, 17].

# drops = Raindrops.new.convert(34)
# # => "34"

require 'pry'

class Raindrops

  def convert(number)
    #to store our output
    output = []
    
    #add words to our output
    output << 'Pling' if number % 3 == 0
    output << 'Plang' if number % 5 == 0
    output << 'Plong' if number % 7 == 0
    
    #print results, if empty return the number
    output.empty? ? number.to_s : output.join('')
  end

end

puts Raindrops.new.convert(28)
puts Raindrops.new.convert(1755)
puts Raindrops.new.convert(34)

binding.pry