require 'pry'

class DNA

  attr_reader :dna

  def initialize(dna)
    @dna = dna.upcase 
    @valid_inputs = ['G','A','T','C','U']
  end

  def count(input)
    #error check
    unless @valid_inputs.include? input
      raise "That's not a nucleotide, silly!"
    end

    @dna.count input
  end #end of count method

  def nucleotide_counts
    hash = {}
    @valid_inputs.each do |i|
      hash[i] = @dna.count i
    end
    hash
  end #end of nucleotide_counts method

  def self.hamming_distance(dna1,dna2)
    if dna1.dna.length != dna2.dna.length
      raise "DNA must be the same length"
    end

    delta = 0

    for counter in 0...(dna1.dna.length)
      delta += 1 if dna1.dna[counter] != dna2.dna[counter]
    end

    delta
  end
end

# s = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
# dna = DNA.new(s)
# puts "T's found = #{dna.count("T")}"
# puts "A's found = #{dna.count("A")}"
# puts "G's found = #{dna.count("G")}"
# puts "C's found = #{dna.count("C")}"
# puts dna.nucleotide_counts

# dna.count("X")

d1 = DNA.new("GAGCCTACTAACGGGAT")
d2 = DNA.new("CATCGTAATGACGGCCT")
puts DNA.hamming_distance(d1,d2)

# binding.pry