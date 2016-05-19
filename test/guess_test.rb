require "minitest/autorun"
require "minitest/pride"
require "./lib/guess"
require "./lib/card"

class GuessTest < Minitest::Test

  def test_it_has_a_card_object
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new(guess, card)

    assert_instance_of Card, guess.card
  end

  def test_it_returns_a_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Juneau", guess.response
  end

  def test_it_asserts_a_correct_answer_is_true
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal true, guess.correct?
  end

  def test_it_lets_user_know_they_have_a_correct_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Correct!", guess.feedback
  end

  def test_it_lets_user_know_they_have_a_wrong_answer
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Incorrect.", guess.feedback
  end

  def test_response_can_be_any_case
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("jUnEAU", card)

    assert_equal "Correct!", guess.feedback
  end

end
