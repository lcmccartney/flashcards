require "minitest/autorun"
require "minitest/pride"
require "./lib/guess"
require "./lib/card"
require "./lib/deck"
require "./lib/round"

class RoundTest < Minitest::Test

  def test_round_object_can_load_a_deck_object
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Deck, round.deck
  end

  def test_guesses_array_returns_an_empty_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_current_card_returns_card_object
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Card, round.current_card
  end

  def test_it_records_guess_and_number_of_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Array, round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_records_incorrect_for_incorrect_answer
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1])
    round = Round.new(deck)

    assert_instance_of Array, round.record_guess("Canada")
    assert_equal 1, round.guesses.count
    assert_equal "Incorrect.", round.guesses.first.feedback
  end

  def test_it_records_number_of_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.record_guess("Juneau")
    round.record_guess("93,000,000")
    round.record_guess("Venus")

    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 3, round.guesses.count
    assert_equal 2, round.number_correct
  end

  def test_it_finds_the_percentage_of_correct_answers
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")
    round.record_guess("2.3")

    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 2, round.guesses.count
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end

end
