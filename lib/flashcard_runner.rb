require_relative "guess"
require_relative "card"
require_relative "deck"
require_relative "round"

card_1 = Card.new("What comes after 3?", "4")
card_2 = Card.new("Meaning of life?", "42")
card_3 = Card.new("What is it?", "it's it")
card_4 = Card.new("What is fear?", "mind killer")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

round.start
