# Kindergarden Garden
# The kindergarden class is learning about growing plants. The teachers thought it would be a good idea to give them actual seeds plant them in actual dirt, and grow actual plants.

# They've chosen to grow grass, clover, radishes, and violets.

# To this end, they've put little styrofoam cups along the window sills, and planted one type of plant in each cup, choosing randomly from the available types of seeds.

# [window][window][window]
# ........................ # each dot represents a styrofoam cup
# ........................
# There are 12 children in the class:

# Alice, Bob, Charlie, David, Eve, Fred, Ginny, Harriet, Ileana, Joseph, Kincaid, and Larry.

# Each child gets 4 cups, two on each row. The children are assigned to cups in alphabetical order.

# The following diagram represents Alice's plants:

# [window][window][window]
# VR......................
# RG......................
# She has [:violets, :radishes, :radishes, :grass].

# Write a program that, given a diagram, can tell you which plants each child has.

# garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
# garden.alice
# # => [:violets, :radishes, :violets, :radishes]
# garden.bob
# # => [:clover, :grass, :clover, :clover]

require 'pry'

# students = %w('Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)
# plants = %w(grass clover radishes violets)

class Garden
  attr_accessor :rows, :students

  def initialize(plants)
    @rows = plants.split("\n")
    @students = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)

    # @
    # @plants = plants.gsub("\n",'').split('')
  end

  def get_plants(student)
    index = @students.index(student)
    plants = []
    # binding.pry
    plants << @rows[0][index]
    plants << @rows[0][index + 1]
    plants << @rows[1][index]
    plants << @rows[1][index + 1]
  end

end

garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")

garden.get_plants("Alice")

binding.pry