class Flashcard
  attr_reader :question, :answer

  def correct?(guess)

  end
end


class Game
  attr_reader :deck, :current_card, :discard

  def initialize(file)
    @deck = []
    @discard = []
    load_cards!(file)
  end

  def load_cards!(file)

  end

  def check_guess(guess)

  end

  def next_card
    #This will need to handle multiple situations:
    # decide whether to put current_card in discard or leave in deck
  end

  def done?

  end

end
