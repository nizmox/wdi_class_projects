require 'pry'

class Robot

  @@names_used = []

  def initialize
    @name = ""
    @chars = ("A".."Z").to_a

    #need some code here
    mac_chars = ("A".."F").to_a
    mac_numb =  (0..9).to_a.map {|a| a.to_s}
    mac_array = mac_chars.concat mac_numb
    @mac_address = "XX:XX:XX:XX:XX:XX"
    @mac_address.gsub!("X",mac_array[rand(mac_array.size)])

    #generate a name for our robot
    set_name


  end

  def set_name
    #loop until we get a unique name
    loop do
      @name = "#{ @chars[rand(26)] }#{ @chars[rand(26)] }#{ rand(9)+1 }#{ rand(9)+1 }#{ rand(9)+1 }"
      #check if this name has already been used
      if @@names_used.include? @name
        puts "The name #{@name} already exists on another robot, generating a new name..."
      else
        break
      end #end of if
    end #end of do loop

    #add this name to the name used array
    @@names_used << @name
  end

  def get_name
    set_name if @name == ""
    #return @name
    @name
  end

  def reset
    puts "Resetting to factory settings."
    @@names_used.delete(@name)
    @name = ""
  end

  def self.names_used
    @@names_used
  end


end

robot = Robot.new
robot1 = Robot.new
robot2 = Robot.new
robot3 = Robot.new
robot4 = Robot.new
robot5 = Robot.new

binding.pry