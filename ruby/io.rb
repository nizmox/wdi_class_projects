print "What is 2 to the 16th power? "
answer = gets.chomp.to_i

while 2**16 != answer
  puts "Wrong! Try again"
  answer = gets.chomp.to_i
end

puts "Correct! Good work, jerk"

print "What is your first name? "
first = gets.chomp

print "What is your last name? "
last = gets.chomp

puts "Your fullname is #{ first } #{ last }"

print "What is your age? "
age = gets.chomp.to_i

if age == 0
  puts "That's not a valid age!"
elsif age >= 18
  puts "Welcome to the speakeasy!"
else
  puts "You are not allowed inside licensed venues!"
end

puts "FYI... You are old" if age >= 60