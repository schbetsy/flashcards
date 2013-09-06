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

class FlashcardGameController
  attr_reader :game, :view


  def initialize(file)
    @game = Game.new(file)
    @view = FlashcardViewer.new

  end

  def run!
    until game.done?
      card = game.next_card
      display_question(card)
      guess = get_guess
      if game.check_guess(guess)
        #do something when correct
      else
        # do something when wrong
      end

    end
  end

  def start_game

  end

  def display_question(card)
    
  end

  def get_guess

  end

end

class FlashcardViewer

  def get_guess
    puts "please enter your answer > "
    gets.chomp
  end

end


FlashcardGameController.new(file).run!
