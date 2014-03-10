require 'pry'

class Animal
  def speak
    puts "I am an animal"
  end

  def move
    puts "I can move"
  end
end

class Mammmal < Animal
  def eat
    puts "I can eat nom nom nom"
  end
  def speak(action)
    puts action
    puts "I can speak"
  end
end

class Monkey < Mammmal
  def swing
    puts "I can swing"
  end
  def speak(action)
    super
    puts "HoWwOo WHoWo"
  end
end

class Dog < Mammmal
  def speak(action)
    super
    puts "Woof"
  end
end

class Person < Animal

  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_s
    puts "Name = #{name}"
    puts "Age = #{age} years old"
    puts "Gender = #{gender.to_s.capitalize}"
  end

  def Person.eye_count
    2
  end

  # def age=(age)
  #   @age = age
  # end

  # def age
  #   return @age
  # end

  # def gender=(gender)
  #   @gender = gender
  # end

  # def gender
  #   @gender
  # end

  # def speak
  #   puts "Good Morning"
  # end

  # def talk(words_to_say)
  #   puts "I like saying #{words_to_say}"
  # end
end

simon = Person.new("Simon", 29, :male)

# class Pet
#   def speak
#     puts "Meow"
#   end
# end

binding.pry
