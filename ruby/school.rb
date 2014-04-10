require 'pry'

class School
  attr_reader :name, :db

  def initialize(name)
    @name = name
    @db = {}
  end

  def add(student,grade)
    if @db.has_key? grade
      @db[grade].push student
    else
      @db[grade] = [student]
    end
  end

  def grade(grade)
    @db[grade]
  end

  def sort
    keys = @db.keys
    keys.sort!
    
    @sorted = {}
    keys.each do |k|
      @sorted[k] = @db[k].sort
    end
    @sorted
  end

end

school = School.new("Haleakala Hippy School")

school.add("Antwon", 1)
school.add("James", 2)
school.add("Phil", 2)
school.add("Jacob", 2)
school.add("Zed", 3)
school.add("Jennifer", 3)
school.add("Little Billy", 1)

binding.pry