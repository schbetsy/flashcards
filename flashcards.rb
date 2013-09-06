$LOAD_PATH << './'

require 'flashcard_viewer.rb'
require 'flashcard_model.rb'



class FlashcardGameController
  attr_reader :game, :view


  def initialize(file)
    @game = Game.new(file)
    @view = FlashcardViewer.new

  end

  def run!
    until game.done?
      #the game chooses which card should be next (at random)
      question = game.next_question!
      # view displays the question
      display_question(question)
      # view prompts for a guess and returns the guess string
      guess = get_guess
      # game determines whether the guess was correct.
      if game.guess_correct?(guess)
        #if it was correct, we discard the current card
        right_answer
        game.discard_current!
      else
        #if it was wrong, the card remains in the deck, and we continue to another card
        wrong_answer
      end

    end
    end_game
  end


  def display_question(question)
    view.display(question)
  end

  def get_guess
    view.get_guess
  end

  def end_game
    view.display("You're done!")
  end

  def right_answer
    view.display("Correct! Moving on...")
  end

  def wrong_answer
    view.display("Incorrect. You'll see this card again.")
  end

end

FlashcardGameController.new('flashcard_samples.csv').run!


