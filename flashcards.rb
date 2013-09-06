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


FlashcardGameController.new(file).run!
