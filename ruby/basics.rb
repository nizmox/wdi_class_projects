22 + 3
'22' + '3'

locale = 'World'

puts "Hello #{locale}"

locale = 'Spain'

#This is a comment

brothers = ['Groucho','Harpo','Chico','Zeppo']

brothers << 'Gummo'

# brothers.each do |x|
#   puts "#{x} Marx"
# end

puts "Process ID:#{ Process.pid }"

# if 15 < 3
#   puts "15 is indeed less than 3"
# elsif 15 < 20
#   puts "15 is less than 20"
# else
#   puts "Something else is going on"
# end

# score = 90

# if score >= 80
#   puts "A grade"
# elsif score >= 70
#   puts "B grade"
# elsif score >= 60
#   puts "C grade"
# else 
#   puts "F"
# end

# brother = "Chico"

# case brother
#   when 'Groucho'
#     puts "Cigar"
#   when 'Chico'
#     puts 'Piano'
#   when 'Harpo'
#     puts 'Harp'
# end

# if true
#   puts "That thing is true"
# end

puts "Please enter a number:"
i = gets.chomp.to_i
puts "You entered #{i}, thankyou!"

while i < 25
  puts "i is less than 25, it is currently = #{i}"
  i += 1
end

puts "I am always printed"