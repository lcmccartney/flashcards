class Round

  attr_reader :deck, :guesses, :number_correct, :card_number

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    @card_number = 1
  end

  def current_card
    @deck.cards[@card_number - 1]
  end

  def record_guess(response)
    guess = Guess.new(response, current_card)
    if guess.card.answer == guess.response
      @number_correct += 1
    end
    @guesses << guess
    @card_number += 1
  end

  def count
    @guesses.count
  end

  def percent_correct
    (@number_correct.to_f/@guesses.count) * 100
  end

  def start
    puts """
Welcome! You are playing with #{deck.count} cards.
-------------------------------------------
         """

    until card_number > deck.count
      puts """
      This is card number #{card_number} out of #{deck.count}.
      Question: #{current_card.question}
      """
      record_guess(gets.chomp)
      puts @guesses.last.feedback
    end

    puts """
****** Game over! ******
You had #{@number_correct} correct guesses out of #{count} for a score of #{percent_correct}%.
         """
    end

end
