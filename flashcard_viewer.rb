class FlashcardViewer

  def get_guess
    puts "Please enter your answer > "
    gets.chomp
  end

  def display(message)
    puts
    puts message
    puts
  end

end
