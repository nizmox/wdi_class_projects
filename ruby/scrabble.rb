require 'pry'

class Scrabble

  @@letter_scores = {
    1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J","X"],
    10 => ["Q","Z"]
  }

  def self.word_score(word)
    #set default score value
    score = 0
    #split word into letters as an array
    letters = word.split("")

    #loop through letters and score each
    letters.each do |l|
      score += self.letter_score(l)
    end

    #return score
    return score

  end

  def self.letter_score(letter)
    ##loop through the letters scores hash
    @@letter_scores.each do |score, letters|
      #is the specified letter inside the array for this score?
      if letters.include? letter.upcase
        #we found it so return the score and stop loopin
        return score
        break
      end
    end

    #this shouldn't happen (-1 error)
    return -1
  end

end

binding.pry

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10