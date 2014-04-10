# Largest product in a series
# Write a program that, when given a string of digits, can calculate the largest product for a series of consecutive digits of length n.

# For example, for the input '0123456789', the largest product for a series of 3 digits is 504 (7 * 8 * 9), and the largest product for a series of 5 digits is 15120 (5 * 6 * 7 * 8 * 9).

# For the input '73167176531330624919225119674426574742355349194934', the largest product is 23520.


require 'pry'

class Product

  def self.largest(num_string, digits)
    #convert the num_string to an array and convert each value to an integer
    num_arr = num_string.split('').map {|n| n.to_i }
    #for testing
    puts num_arr.join(',')
    #to store the largest value
    largest = 0
    #counter for our array
    counter = 0
    while counter + digits <= num_arr.length
      #multiply the numbers together
      result = num_arr[counter,digits].inject(:*)
      #for testing
      puts "#{num_arr[counter,digits]} = #{result} "
      #replace largeset with the new value if it is greater than the old value
      largest = result if result > largest
      #increment the counter
      counter += 1
    end

    largest
  end

end

binding.pry

p1 = Product.largest('73167176531330624919225119674426574742355349194934', 3)