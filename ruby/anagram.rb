require 'pry'

class Anagram

  def self.listen(word,anagrams)
    target = word.split('').sort

    anagrams.each do |word|
      return word if word.split('').sort == target
    end

  end

end

Anagram.listen('listen',%w(enlists google inlets banana))

binding.pry