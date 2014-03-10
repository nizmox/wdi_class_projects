require 'pry'

class Car
  attr_accessor :color, :seating_material, :max_speed, :brand

  def initialize(color, seating_material)
    @color = color
    @seating_material = seating_material
  end

  def to_s
    puts "This car is a #{brand} #{self.class}. It is #{color} with #{seating_material} seats. It's max speed is #{max_speed} km/h."
  end

end

class Italia458 < Car

  def initialize(color, seating_material)
    super
    @max_speed = 325
    @brand = 'Ferarri'
  end

end

class Focus < Car

  def initialize(color, seating_material)
    super
    @max_speed = 248
    @brand = 'Ford'
  end

end

class Lancer < Car

  def initialize(color, seating_material)
    super
    @max_speed = 200
    @brand = 'Mitsubishi'
  end

end

simons_car = Focus.new('black', 'fabric')
rich_guys_car = Italia458.new('red','leather')
seans_car = Lancer.new('red','fabric')

binding.pry
