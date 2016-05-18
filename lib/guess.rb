class Guess

  attr_reader :card, :response

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    @card.answer == @response
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
  
end
