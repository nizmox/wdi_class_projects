require 'pry'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []

    # Populate the deck of cards
    suits = [:hearts,:clubs,:diamonds,:spades]
    values = [:ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]

    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(suit,value)
      end
    end

  end

  def deal(n=1)
    @cards.slice!(1,n)
  end

  def shuffle
    @cards.shuffle!
  end

  def size
    @cards.count
  end

  def print_cards
    @cards.each_with_index do |card, index|
      puts "#{index + 1}: #{card}"
    end
  end
end

class Card
  attr_accessor :suit, :value

  def initialize(suit='Undefined', value='Undefined')
    @suit = suit
    @value = value.to_s
  end

  def to_s
    "#{@value} of #{@suit}"
  end
end

class Player
  attr_accessor :name, :hand

  def initialize(name)
    @name = name
    @hand = []
  end

  def draw(deck)
    @hand.merge(deck.deal(1))
  end

  def print_hand
    # implement here
  end
end

d1 = Deck.new
d1.shuffle

players = [Player.new('Hans'),Player.new('Bernard'),Player.new('Jonesy')]

#deal 7 cards to each player
players.each do |player|
  player.hand = d1.deal 7
end

#print players and hand
puts "--------------------"
players.each do |player|
  puts "Name: #{player.name}"
  player.hand.each do |card|
    puts "#{card.suit} - #{card.value}"
  end
  puts "--------------------"
end

binding.pry