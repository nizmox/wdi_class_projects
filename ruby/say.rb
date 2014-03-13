class Say
  def initialize(number)
    @number = number.to_i
  end

  def in_english
    words = {0=>"zero",1=>"one",2=>"two",3=>"three",4=>"four",5=>"five",6=>"six",7=>"seven",8=>"eight",9=>"nine",
             10=>"ten",11=>"eleven",12=>"twelve",13=>"thirteen",14=>"fourteen",15=>"fifteen",16=>"sixteen",
             17=>"seventeen", 18=>"eighteen",19=>"nineteen",
             20=>"twenty",30=>"thirty",40=>"forty",50=>"fifty",60=>"sixty",70=>"seventy",80=>"eighty",90=>"ninety"}

    #catch our errors first
    if @number < 0 || @number > 99
      puts "value out of range"
    #if our number is less than 21 OR is a whole number
    elsif @number < 21 || @number % 10 == 0
      #print out our number
      puts words[@number]
    #if our number is less 100 (and per above is NOT a whole number)
    else
      #returns the divisor and the remainder in an array with two values
      first, last = @number.divmod(10)
      first *= 10
      #print out our number
      puts words[first] + " " + words[last]
    end #end of if
  end #end of in_english
end

Say.new(0).in_english
Say.new(14).in_english
Say.new(50).in_english
Say.new(98).in_english
Say.new(-1).in_english
Say.new(100).in_english

