class FlashcardViewer

  QUIT_FLAG = ":-("

  def get_guess
    print "Please enter your answer > "
    gets.chomp
  end

  def display(message)
    puts "\n#{message}\n\n"
  end

  def print_question(question)
    puts wrap(question) + "\n"
  end

  def welcome
    puts <<-START
     ---------------------------------
    |                                 |
    |                                 |
    |            Welcome!             |
    |                                 |
    |                                 |
     ---------------------------------

       At any time, type :-( to exit.

    START
  end

  def end_game
    puts "\nYou're awesome!\n"
  end

  def wrong_answer
    puts "\nIncorrect. You'll see this card again.\n"
  end

  def correct_answer
    puts "\nCorrect! Moving on...\n"
  end

  def refresh_screen!
    clear_screen!
    move_to_home!
  end

  def enter_to_continue
    puts "\nPress <enter> to continue..."
    gets
  end

  def quit?(flag)
    QUIT_FLAG == flag
  end


  private

  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end

  def wrap(s, width = 78)
    s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
  end

end
