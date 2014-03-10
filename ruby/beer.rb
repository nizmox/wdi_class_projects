# WHEN ONE REMAINS
# 1 bottle of beer on the wall, 1 bottle of beer.
# Take it down and pass it around, no more bottles of beer on the wall.

# WHEN NONE LEFT
# No more bottles of beer on the wall, no more bottles of beer.
# Go to the store and buy some more, 99 bottles of beer on the wall.

require 'pry'

class Beer
  def self.song(num_bottles)
    if num_bottles < 1
      puts "That's crazy talk"
      return
    end

    num_bottles.downto(2) do |b|
      puts "#{b} bottles of beer on the wall, #{b} bottles of beer."
      puts "Take one down and pass it around, #{b - 1} #{self.pluralize_bottles(b - 1)} of beer on the wall."
      puts " "
    end
    puts "1 bottle of beer on the wall, 1 bottle of beer."
    puts "Take it down and pass it around, no more bottles of beer on the wall."
    puts " "
    puts "No more bottles of beer on the wall, no more bottles of beer."
    puts "Go to the store and buy some more, 99 bottles of beer on the wall."
  end

  def self.pluralize_bottles(n)
    n.abs == 1 ? "bottle" : "bottles"
  end
end

class Fixnum
  def bottles_of_beer
    Beer.song(self)
  end
end

binding.pry

#invoke the class method and pass in 99
#Beer.song(99)

