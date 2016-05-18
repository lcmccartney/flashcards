require "minitest/autorun"
require "minitest/pride"
require "./lib/guess"
require "./lib/card"
require "./lib/deck"

class DeckTest < Minitest::Test

  def test_desk_loads_an_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1])

    assert_instance_of Array, deck.cards
  end

  def test_it_creates_a_new_deck_of_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_it_counts_number_of_cards_in_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1])

    assert_equal 1, deck.count

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck = Deck.new([card_1, card_2])

    assert_equal 2, deck.count
  end

end
