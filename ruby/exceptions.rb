require 'pry'

puts 'welcome'

begin
  print 'what do you want to divide by? '
  divisor = gets.to_i
  puts "the result of 3 / #{ divisor } is #{ 3.to_f / divisor }"
rescue
  puts "That divisor is no good"
  retry
ensure
  puts "You will ALWAYS see this message"
end

# puts "this code is about to explode"
# raise "boom!"