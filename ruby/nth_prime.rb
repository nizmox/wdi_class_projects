# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# Write a program that can tell you what the nth prime is.

# What is the 10 001st prime number?

require 'pry'
require 'prime'

class GetPrime

  def self.find_nth(n)
    #generate an array of the first X primes
    primes = Prime.first(n)
    #return the last prime in the array
    primes.last
  end

end

p1 = GetPrime.find_nth(6)
p2 = GetPrime.find_nth(10001) 

binding.pry