# 2. [6] Modify the previous program to allow Fred to match as well. Does it
# match now if your input string is Fred, frederick, or Alfred? (Add lines with
# these names to the text file.)

ARGF.each do |line|
  if line =~ /[Ff]red/ 
    #print line
    puts line
  end
end