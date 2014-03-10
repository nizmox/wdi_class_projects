require 'pry'

class Fixnum

  def leap_year?
    if self % 100 == 0
      self % 400 == 0 ? true : false
    else
      self % 4 == 0 ? true : false
    end
  end

end

#not leap years as per the interweb
not_ly = [1700, 1800, 1900, 2100, 2200, 2300, 2500, 2600]
#leap years
is_ly = [1600, 2000, 2400, 2008, 2012]

#TEST CASES

puts "TEST: should be false"
not_ly.each do |y|
  puts y.leap_year?
end

puts "TEST: should be true"
is_ly.each do |y|
  puts y.leap_year?
end

binding.pry