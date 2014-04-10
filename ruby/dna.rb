require 'pry'

class DNA

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