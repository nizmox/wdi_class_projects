# Palindrome Product
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 x 99.

# Write a program that can detect palindrome products in a given range.

require 'pry'

class Palindrome

  attr_accessor :range

  def initialize(start, endz)
    @range = start..endz
  end

  def find_palindromes
    #convert range to an array
    numbers = @range.to_a
    #to store the palindromes found
    palindromes = []

    numbers.each do |num|
      #if the first and second half ar the same, add these to the array
      palindromes << num if num.to_s == num.to_s.reverse
    end

    #return the palindromes
    palindromes
  end#palindrome

end

p1 = Palindrome.new(1,100)
p2 = Palindrome.new(1000,10000)

binding.pry