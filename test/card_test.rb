require "minitest/autorun"
require "minitest/pride"
require "./lib/card"

class CardTest < Minitest::Test

  def test_it_creates_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_instance_of Card, card
  end

  def test_it_returns_a_question
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_it_returns_an_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "Juneau", card.answer
  end

end
