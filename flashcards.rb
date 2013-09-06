$LOAD_PATH << './'

require 'flashcard_viewer.rb'
require 'flashcard_model.rb'



class FlashcardGameController
  attr_reader :game, :view, :flashcard_files


  def initialize(*files)
    #@game = Game.new(file)
    @view = FlashcardViewer.new
    @flashcard_files = files

  end

  def run!
    refresh_screen
    welcome
    enter_to_continue

    display_file_options
    file_id = get_file_selection
    file = flashcard_files[file_id.to_i - 1]
    return if quit?(file_id)

    @game = Game.new(file)

    until game.done?
      refresh_screen
      #the game chooses which card should be next (at random)
      question = game.next_question!
      previous_guesses = game.previous_guesses
      # view displays the question
      display_question(question, previous_guesses)
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
        game.add_incorrect_guess(guess)
        wrong_answer
      end

      enter_to_continue

    end
    end_game if game.done?
  end


  def display_question(question, previous_guesses)
    view.print_question(question, previous_guesses)
  end

  def display_file_options
    puts "Available decks: "
    flashcard_files.each_with_index do |file_name, index|
      puts "#{index+1}: #{file_name.gsub(/(.*).csv/, "\\1")}"
    end
  end

  def get_file_selection
    print "> "
    gets.chomp
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

FlashcardGameController.new('flashcard_tester.csv','ruby_easy.csv','ruby_hard.csv').run!


