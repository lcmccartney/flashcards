require "./lib/guess"
require "./lib/card"
require "./lib/deck"
require "./lib/round"
require "./lib/card_generator"

puts "Enter the name of the deck you wish to use:"
filename = gets.chomp + ".txt"

cards = CardGenerator.new(filename).cards

deck = Deck.new(cards)

round = Round.new(deck)

round.start
