require 'pry'

class Triangle

  def initialize(side1, side2, side3)
    #validate the triangle
    @sides = [side1, side2, side3]
    @sides.sort!

    #check the two smallest side against the largest sides
    if @sides[0] + @sides[1] < @sides[2] || @sides[0] <= 0
      raise 'invalid triangle'
    end  

  end #end of initialize

  def type
    case @sides.uniq.length
    when 1
      :equilateral
    when 2
      :isosceles
    else
      :scalene
    end
  end #end of type

end

puts "expect Equilateral"
t1 = Triangle.new(3,3,3)
puts t1.type

puts "expect Isosceles"
t2 = Triangle.new(3,3,4)
puts t2.type

puts "expect Scalene"
t3 = Triangle.new(3,4,5)
puts t3.type

puts "expect ERROR"
t4 = Triangle.new(1,1,50)

# binding.pry