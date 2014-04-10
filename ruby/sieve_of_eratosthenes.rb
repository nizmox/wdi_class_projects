require 'pry'

class Sieve

  def self.find_primes(number, logging)
    # list all numbers from two up to specified number as array
    candidates = (2..number).to_a

    # an array to store our prime numbers
    primes = []

    #loop through all of our candidates
    until candidates.empty?
      #the first number in our array is prime so move it to primes
      primes << candidates.shift
      #if logging is on log the prime
      puts "found prime #{primes.last}" if logging

      # Mathilda's solution
      candidates.reject! do |number|
        number % primes.last == 0
      end
      
      # #set the initial test value
      # multiple = primes.last * 2
      # while multiple <= number
      #   #if logging is on log the delete number
      #   puts " - deleting #{multiple}" if logging
      #   candidates.delete(multiple)
      #   multiple += primes.last
      # end
    end

    #return our list of primes
    primes

  end

end


Sieve.find_primes(100,true)

binding.pry