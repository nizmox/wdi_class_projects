require 'pry'
require 'date'

def age (year,month,day)
  dob = Date.new(year,month,day)
  today = Date.today

  #count the number of years from birth year to this year
  age = today.year - dob.year

  #if birthday has not past this year, subtract one from age
  if today - Date.new(today.year,month,day) < 0
    age -= 1
  end

  #return age
  age
end

# Terminal Input
# puts "what year were you born?"
# year = gets.to_i
# puts "what month were you born? (as a 2 digit number)"
# month = gets.to_i
# puts "what day were you born?"
# day = gets.to_i

# puts age(year,month,day)

# Test cases
puts "Tests..."
puts "should return 29"
puts age(1984,3,13)
puts "should return 30"
puts age(1984,3,12)
puts "should return 30"
puts age(1984,3,11)