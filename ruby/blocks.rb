nums = [1, 3, 5, 7, 11, 13, 17, 19, 23, 29]

i = 0

while i < nums.length
  puts "The prime number #{ nums[i] }"
  i += 1
end

nums.each do |p|
  puts "The prime number #{ p }"
end

# while x = nums.shift
#   puts "The prime number #{ x }"
# end

kittens = "Buttons:Snowball:Fluffy:Mister Sinister:Craigsy".split ":"

kittens.each do |kitty|
  puts "The adorable #{kitty}"
end 


# nums.each do |x|
#   puts x
# end
