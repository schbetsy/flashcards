class Flashcard
  attr_reader :question, :answer

  def initialize(params)
    @question = params[:question]
    @answer = params[:answer]
  end

  def correct?(guess)
    guess.downcase == answer.downcase
  end
end

require "csv"

class Game
  attr_reader :current_card

  def initialize(file)
    @deck = []
    @discard = []
    @file = file
  end

  def load_cards!
    CSV.foreach(file, { :headers => true }) do |row|
      add_card(Flashcard.new( { :question => row["question"],
                                :answer => row["answer"] }))
    end
  end

  def check_guess(guess)
    current_card.correct?(guess)
  end

  def shuffle_deck!
    deck.shuffle!
  end

  def reset_deck
    @deck = discard
    @discard = []
  end

  def entire_deck
    deck
  end

  def next_card
    discard_current_card
    draw_new_card
  end

  def previous_card
    reverse_draw_new_card
    reverse_discard_current_card
  end

  def remaining_cards
    deck.length
  end

  def completed_cards
    discard.length
  end

  def done?
    deck.empty?
  end

  private

  attr_reader :deck, :discard, :file

  def add_card(card)
    @deck << card
  end

  def discard_current_card
    discard << current_card
  end

  def draw_new_card
    @current_card = deck.pop
  end

  def reverse_discard_current_card
    @current_card = discard.pop
  end

  def reverse_draw_new_card
    deck << current_card
  end

end
