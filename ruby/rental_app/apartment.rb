class Apartment
  attr_accessor :name, :rent, :sqft, :num_bathrooms, :num_bedrooms, :renters

  def initialize(name, sqft, num_bathrooms, num_bedrooms)
    @name = name
    @rent = 0
    @sqft = sqft
    @num_bathrooms = num_bathrooms
    @num_bedrooms = num_bedrooms
    @renters = []
  end

  def is_occupied?
    @renters.any?
  end

  def to_s
    puts "the apartment #{@name} is #{@sqft} square feet and has #{@renters.count} renters"
  end
end


