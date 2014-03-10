require 'pry'

def area (length, width)
  puts "Length #{ length }"
  puts "Width #{ width }"
  a = length * width
end

def volume (length, width, height)
  puts "Dimensions are #{ length }L, #{width}W and #{height}H"
  a = area(length, width) * height
end

# puts "The area is #{ area(5,10) }"

# living_room_area = area(18, 24)
# puts "The living room area is #{ living_room_area }"

# living_room_volume = volume(18, 24, 5)
# puts "The living room volume is #{ living_room_volume }"

def square (x)
  x ** 2
end

puts square(4)

def cube (x)
  x ** 3
end

puts cube(4)

def name_tag_generator(first, last, gender, age)
  if gender == 'f'
    if age < 19
      puts "Miss #{ first } #{ last }"
    else
      puts "Ms #{ first } #{ last }"
    end
  else
    puts "Mr #{ first } #{ last }"
  end
end

# def what_to_wear (indoor_temp, outdoor_temp)
#   if outdoor_temp == 'cold' && indoor_temp == 'hot'
#       answer = "You can wear a jumper and take it off inside!"
#   elsif outdoor_temp == 'cold' && indoor_temp == 'cold'
#       answer = "You're going to need to keep your jumper on!"
#   elsif outdoor_temp == 'hot' && indoor_temp == 'hot'
#       answer = "Wear a tshirt and shorts!"
#   elsif outdoor_temp == 'hot' && indoor_temp == 'cold'
#       answer = "Hmmmm this is a dilemma, you'll need warm clothes but then you're going to sweat like crazy outside."
#   else
#     answer = "You make-a no sense-a"
#   end
# end

# ga_campus = what_to_wear('cold','hot')
# puts ga_campus

binding.pry

