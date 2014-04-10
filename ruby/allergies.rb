# Allergies
# An allergy test produces a single numeric score which contains the information about all the allergies the person has (that they were tested for).

# The list of items (and their value) that were tested are:

# eggs (1)
# peanuts (2)
# shellfish (4)
# strawberries (8)
# tomatoes (16)
# chocolate (32)
# pollen (64)
# cats (128)
# So if Tom is allergic to peanuts and chocolate, he gets a score of 34.

# Write a program that, given a person's score can tell them

# a) whether or not they're allergic to a given item, and b) the full list of allergies.

# allergies = Allergies.new(34)
# allergies.allergic_to?('chocolate')
# => true
# allergies.allergic_to?('cats')
# => false
# allergies.list
# => ['peanuts', 'chocolate']

require 'pry'

class Allergy
  attr_accessor :name, :score

  def initialize(name,score)
    @name = name
    @score = score
  end
end

class Allergies
  attr_accessor :score, :allergies

  def initialize(score)
    @score = score
    #setup the allergies
    @allergies = []
    add_allergies
  end

  def add_allergies
    @allergies << Allergy.new('eggs',1)
    @allergies << Allergy.new('peanuts',2)
    @allergies << Allergy.new('shellfish',4)
    @allergies << Allergy.new('strawberries',8)
    @allergies << Allergy.new('tomatoes',16)
    @allergies << Allergy.new('chocolate',32)
    @allergies << Allergy.new('pollen',64)
    @allergies << Allergy.new('cats',128)
    #sort from highest to lowest score
    @allergies.sort! {|x,y| y.score <=> x.score}
  end

  def allergic_to?(allergy)
    list.include? allergy
  end

  def list
    #save the score so that it can be subtracted from as we loop
    curr_score = @score
    #to store allergies for this score
    all_arr = []

    @allergies.each do |allergy|
      #if the allergy score is less than the current score
      if allergy.score <= curr_score
        #add the allergy to the list
        all_arr << allergy.name
        #reduce current score by this allergies score
        curr_score -= allergy.score
      end 
    end

    #return our allergies array
    all_arr
  end

end

a1 = Allergies.new(34)

binding.pry

