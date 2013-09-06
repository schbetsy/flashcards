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
    refresh_screen
    welcome
    enter_to_continue

    until game.done?
      refresh_screen
      #the game chooses which card should be next (at random)
      question = game.next_question!
      # view displays the question
      display_question(question)
      # view prompts for a guess and returns the guess string
      guess = get_guess

      break if quit?(guess)
      # game determines whether the guess was correct.
      if game.guess_correct?(guess)
        #if it was correct, we discard the current card
        right_answer
        game.discard_current!
      else
        #if it was wrong, the card remains in the deck, and we continue to another card
        wrong_answer
      end

      enter_to_continue

    end
    end_game if game.done?
  end


  def display_question(question)
    view.print_question(question)
  end

  def get_guess
    view.get_guess
  end

  def end_game
    view.end_game
  end

  def right_answer
    view.correct_answer
  end

  def wrong_answer
    view.wrong_answer
  end

  def refresh_screen
    view.refresh_screen!
  end

  def enter_to_continue
    view.enter_to_continue
  end

  def welcome
    view.welcome
  end

  def quit?(guess)
    view.quit?(guess)
  end

end

FlashcardGameController.new('flashcard_samples.csv').run!


