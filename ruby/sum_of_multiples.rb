# Sum of Multiples
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Write a program that, given a number, can find the sum of all the multiples of 3 or 5 up to and including that number.

# Allow the program to be configured to find the sum of multiples of numbers other than 3 and 5.

require 'pry'

class Multiples
  def initialize(number, multiples)
    @number = number
    @multiples = multiples
  end

  def numbers

    results = []

    #loop from 1 up to the number input
    1.upto(@number - 1) do |num|
      #for each multiple, check if it is equally divisible
      @multiples.each do |multiple|
        #if it is, add it to our results array
        results << num if num % multiple == 0 && !results.include?(num)
      end
    end

    #return our results
    results
  end

  def sum
    #sum all results from our numbers method
    numbers.inject{|sum,x| sum + x }
  end
end

m1 = Multiples.new(10,[3,5])
m2 = Multiples.new(99,[4,7,12])

binding.pry