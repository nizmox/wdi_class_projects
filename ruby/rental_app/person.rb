class Person
  attr_accessor :name, :age, :gender, :apartment

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_s
    puts "#{@name} is a #{@age} year old #{@gender}"
  end
end