#ARGV provides all arguments passed when running ruby [filename] [args]
#ARGF provides access to the content of any file passed in as an arguement
#you could print this out using => ARGF.each { |line| puts line }

require 'pry'

# binding.pry

# puts ARGV.join('')

# if (ARGV[0] == 'groucho')
#   puts "Hey there groucho!"
# end

ARGF.each do |line|
  #if the line contains the word guy
  if line =~ /guy/ 
    #print it in uppercase
    puts line.upcase
  end
end