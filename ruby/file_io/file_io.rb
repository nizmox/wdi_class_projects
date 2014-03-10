class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_s
    puts "#{ @name } is a #{ gender } and is #{ age } years old"
  end
end

#filesname, access mode (read, write, append etc...)
f = File.new('database.txt', 'a+')

print "Write name to file? (y/n) "
response = gets.chomp.downcase

while response == 'y'
  print "Enter name, age, gender: "
  f.puts(gets.chomp)

  print "Write name to file? (y/n) "
  response = gets.chomp.downcase
end
  
#close the file
f.close

people = []

f = File.new('database.txt', 'r')

f.each do |line|
  puts "The line from the file is: #{ line }"
  data = line.chomp.split(", ")
  person = Person.new(data[0].strip, data[1].strip, data[2].strip)
  people << person
end

f.close

people.each do |person|
  puts "the person is #{ person.to_s }"
end