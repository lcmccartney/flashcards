require "minitest/autorun"
require "minitest/pride"
require "./lib/guess"
require "./lib/card"
require "./lib/deck"
require "./lib/round"
require "./lib/card_generator"

class CardGeneratorTest < Minitest::Test

  def test_it_creates_a_card_generator
    card_generator = CardGenerator.new('cards_test.txt')
    assert_instance_of CardGenerator, card_generator
  end

  def test_it_creates_an_array_with_elements
    card_generator = CardGenerator.new('cards.txt')
    assert_equal Array, card_generator.cards.class
    refute card_generator.cards.empty?
  end

  def test_element_in_array_is_a_card
    card_generator = CardGenerator.new('cards.txt')
    assert_instance_of Card, card_generator.cards.first
  end

  def test_it_returns_question_from_card_element

  end

      # cards = CardGenerator.new(filename).cards
end
