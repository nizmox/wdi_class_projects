# 6. [8] Extra credit exercise: write a program that prints out any input line
# that mentions both wilma and fred.

ARGF.each do |line|
  if line =~ /[Ww]ilma.*[Ff]red|[Ff]red.*[Ww]ilma/ 
    #print line
    puts line
  end
end