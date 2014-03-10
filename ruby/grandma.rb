require 'pry'

class Grandma

  def talk

    bye = 0

    puts "Type a sentence to talk to grandma..."

    until bye > 2

      you_say = gets.chomp

      if you_say == "BYE" 
        bye += 1

        if bye < 3
          puts "Grandma Says: Sorry dear, I can't hear you..."
        else
          puts "Goodbye then, just leave me here to die in my retirement home..."
        end

      elsif you_say == you_say.upcase
        year = (1938..1950).to_a.sample
        puts "Grandma Says: NO, NOT SINCE #{year}!"
        
        bye = 0

      else
        puts "Grandma Says: HUH?! SPEAK UP, SONNY!"

        bye = 0

      end #end of if

    end #end of while

  end #end of say method

end #end of Grandma class

nanna = Grandma.new
nanna.talk

binding.pry