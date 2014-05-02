# 4. [8] Make a program that prints each line that has a word that is
# capitalized but not ALL capitalized. Does it match Fred but neither fred nor
# FRED?

ARGF.each do |line|
  #if the line contains the word guy
  if line =~ /[A-Z][a-z]+/ 
    #print line
    puts line
  end
end