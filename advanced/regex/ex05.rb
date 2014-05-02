# 5. [8] Make a program that prints each line that has a two of the same
# nonwhitespace characters next to each other. It should match lines that
# contain words such as Mississippi, Bamm-Bamm, or llama.

ARGF.each do |line|
  #if the line contains two consecutive of the same chacter (\1 uses the result of the first group)
  if line =~ /([A-z])\1/ 
    #print line
    puts line
  end
end