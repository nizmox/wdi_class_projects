def secret_number
  number = random_num
  #puts "For Testing, Number is #{number}"

  #loop should start here

  exit = false

  while !exit

    puts "Please guess a number between 1 and 10"
    guess = gets.chomp.to_i

    case
    when guess <= 0 || guess > 10
      puts "That's not a valid option, please try again..."
    when guess == number
      puts "Congrats, the number was #{number}, you win the game!"
      puts "-----------------------------------------------------"

      #ask if user would like to replay the game?
      puts "Would you like to play again? (y/n)"
      response = gets.chomp

      if response == "y"
        number = random_num
      else
        exit = true
      end

    when guess > number
      puts "Sorry but your guess was too high, please try again"
    when guess < number
      puts "Sorry but your guess was too low, please try again"
    else
      puts "Sh!t, this shouldn't happen!?"  
    end

  end

end

def random_num
  Random.rand(1..10)
end

secret_number