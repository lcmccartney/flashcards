class CardGenerator

  def initialize(file)
    @file = file
  end

  def cards
    cards = File.readlines(@file).map do |line|
      question, answer = line.chomp.split(",")
      Card.new(question, answer)
    end
    cards
  end

end
