# loop do
#   numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
#   numbers.shuffle!
#   puts "What is #{numbers[0]} + #{numbers[1]}?"
#   answer = gets.chomp.to_i

#     if answer == numbers[0] + numbers[1]
#       puts "You got it right!"
#     elsif answer == 0
#       puts "Do you want to quit? (y or n)"
#       quit = gets.chomp
#        if quit == "y".downcase
#          break
#        end
#     else
#       puts "You got it wrong. Try again."
#       puts "What is #{numbers[0]} + #{numbers[1]}?"
#       answer2 = gets.chomp.to_i
#          if answer2 == numbers[0] + numbers[1]
#           puts "You got it right!"
#          until answer2 == numbers[0] + numbers[1]
#         end
#       end
#    end
# end

exit = false

until exit 
num1 = (1..12).to_a.sample
num2 = (1..12).to_a.sample
answer = 0

  while answer != (num1 + num2)
    puts "What is #{num1} + #{num1}? (or type \"exit\" to quit)"
    answer = gets.chomp.to_i

    answer.downcase == "exit" ? exit = true
  end

end
