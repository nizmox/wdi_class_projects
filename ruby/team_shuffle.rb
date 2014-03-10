require 'pry'

#WDI class
wdi = ["Anne Homann",
"Charlie Gerard",
"Erik Froese",
"Kriss Heimanis",
"Mark Pereira",
"Nix Siow",
"Olly Dutton",
"Simon Taylor",
"Tom Date"
#"Random Guy",
#"Random Girl"
]

#randomise the WDI team members
wdi.shuffle!

#create an array to store our arrays of teams
groups = []


#loop until the user has entered a sensible value for team size
repeat = true

while repeat

  #the max team size should be no more than half the team (this is an integer so it will auto round down)
  max = wdi.size / 2

  #get user input for team size
  puts "How large do you want the teams to be? (enter a number between 2 and #{max})"
  size = gets.chomp.to_i

  #check validity of input
  if size < 2 || size > max
    puts "Invalid input, please re-enter"
  else
    repeat = false
  end

end

#to store our current team
team = []

#loop until all wdi members have been assigned to a team
while wdi.size > 0

  #we have enough people for a full sized team
  if wdi.size >= size

    #pop from wdi = the team size and add to 'team'
    size.times do 
      team.push wdi.pop
    end

    #add the finished team to our groups array
    groups.push team

    #reset the team
    team = []

  #there are insufficient people for a full sized team
  else

    #create a final team with the remainder
    while wdi.size > 0
      team.push wdi.pop
    end

    #append this team to the last team
    groups.last.concat(team)

  end
end

#print the groups
groups.each_with_index do |team,i|
  #print the current team
  puts "Team Number: #{i + 1}"
  team.each_with_index do |people,x|
    #print the current person
    puts "#{x + 1}: #{people}"
  end  
  puts "--------"
end


#launch pry
#binding.pry