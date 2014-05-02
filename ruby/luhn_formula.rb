# Luhn Formula
# Write a program that can take a number and determine whether or not it is valid per the Luhn formula.

# The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.

# The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

# Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.

# For any digits that thus become 10 or more, subtract 9 from the result.

# E.g., 1111 becomes 2121, while 8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).

# Add all these digits together. For example, if 1111 becomes 2121, then 2+1+2+1 is 6; and 8763 becomes 7733, so 7+7+3+3 is 20.

# If the total ends in 0 (put another way, if the total modulus 10 is congruent to 0), then the number is valid according to the Luhn formula; else it is not valid. So, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

# Write a program that, given a number

# a) can check if it is valid per the Luhn formula. b) can add a check digit to make the number valid per the Luhn formula.
require 'pry'

class Luhn
  def initialize(number)
    @number = number
  end

  def valid?
    #sum all numbers in the array
    sum = convert.inject(:+)

    #if the last digit is = 0 it is valid else not valid
    sum % 10 == 0
  end

  private
  def digits
    @number.to_s.chars.map(&:to_i)
  end

  def convert
    #create an array of digits and reverse these
    num_array = digits.reverse

    count = 1
    while count <= num_array.length
      #multiply the number by two  
      number = num_array[count] * 2
      #if the number is greater than 10, subtract nine
      number -= 9 if number >= 10
      #update the array with the modified number
      num_array[count] = number
      #increment the counter by 2 (to loop through every second value)
      count += 2  
    end  
    
    #return the modified array
    num_array.reverse

  end#convert

end

l1 = Luhn.new(2323_2005_7766_3554) #.valid?
# => true

binding.pry