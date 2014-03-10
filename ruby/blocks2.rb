vices = {
  :groucho => 'cigars',
  :harpo => 'girls',
  :chico => 'pranks'
}

vices.each do |k,v|
  puts "Key: #{k} = Value: #{v}"
end

12.times do
  puts "Beetlejuice"
end

5.downto(1) do |n|
  puts n
end
puts "Blastoff!"

10.upto(23) do |j|
  puts "Here is an interesting number #{j}"
end

array = (1..100).to_a

odds = array.select do |n|
  n.odd?
end