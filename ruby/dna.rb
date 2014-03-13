require 'pry'

class DNA

  def initialize(dna)
    @dna = dna
  end

  def count(input)
    valid_inputs = ['G','A','T','C']
    unless valid_inputs.include? input
      raise "That's not a nucleotide, silly!"
      # break
    end

    counter = 0
    segments = @dna.split ""
    segments.each do |s|
      counter += 1 if s == input
    end
    counter
  end

  def nucleotide_counts
    hash = {}
    segments = @dna.split ""
    segments.each do |s|
      hash.has_key?(s) ? hash[s] += 1 : hash[s] = 1
    end #end of segments loop
    hash
  end #end of nucleotide_counts method

end

s = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
dna = DNA.new(s)
puts "T's found = #{dna.count("T")}"
puts "A's found = #{dna.count("A")}"
puts "G's found = #{dna.count("G")}"
puts "C's found = #{dna.count("C")}"
puts dna.nucleotide_counts

dna.count("X")

# binding.pry