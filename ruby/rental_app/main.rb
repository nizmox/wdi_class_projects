require 'pry'

require_relative 'building'
require_relative 'apartment'
require_relative 'person'

#simon = Person.new("Simon", 29, :male)
building = Building.new('9-11 Cowper Street', 'New Apartment', false, true, 5)

response = nil

while response != 'q'

  print "add (p)erson, (a)partment, p(r)int or (q)uit: "
  response = gets.chomp.downcase

  if response == 'p'
    print 'name: '
    name = gets.chomp

    print 'age: '
    age = gets.to_i

    print 'gender: '
    gender = gets.chomp

    print 'which apartment do you want to live in: '
    apt = gets.chomp

    building.apartments[apt].renters << Person.new(name, age, gender)

  elsif response == 'a'
    print 'name: '
    name = gets.chomp

    print 'square feet:'
    sqft = gets.to_i

    building.apartments[name] = Apartment.new(name, sqft, 0, 0)

  elsif response == 'r'
    #print building details
    puts building.to_s

    #print apartment and associated people
    building.apartments.each do |a|
      puts a.to_s

      a.each do |p|
        puts p.to_s
      end

    end

  else
    puts "you've input an invalid response"
  end

end

#binding.pry

