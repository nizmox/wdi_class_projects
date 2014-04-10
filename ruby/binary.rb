require 'pry'

class Binary

  attr_accessor :number

  def initialize(number)
    @bits = number.split('').reverse
    #don't think this works!
    raise 'Not a binary string' unless @bits.all? { |bit| bit == '0' || bit == '1'}
  end

  def convert
    total = 0

    @bits.each_with_index do |bit,i|
      (total += 2 ** i) if bit == '1'
    end

    total

    # binding .pry
  end
end

puts "-------------------"

b1 = Binary.new('1011001')
b2 = Binary.new('1101')
b3 = Binary.new('110110110110101')
puts "result #{b1.convert}"
puts "result #{b2.convert}"
puts "result #{b3.convert}"

#1 + 0 + 0 + 8 + 16 + 0 + 64 = 89

binding.pry