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

  def initialize(file)
    @deck = []
    @discard = []
    @file = file
    @current_card = nil
  end

  def load_cards!
    CSV.foreach(file, { :headers => true }) do |row|
      add_card(Flashcard.new( { :question => row["question"],
                                :answer => row["answer"] }))
    end
  end

  def discard_current!
    discard_current_card
    remove_card_from_deck(current_card)
  end

  def next_question!
    draw_new_card.question
  end

  def guess_correct?(guess)
    current_card.correct?(guess)
  end

  def reset_deck
    @deck = discard
    @discard = []
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

  attr_reader :deck, :discard, :file, :current_card

  def add_card(card)
    @deck << card
  end

  def discard_current_card
    discard << current_card
  end

  def remove_card_from_deck(this_card)
    @deck.delete(this_card)
  end

  def draw_new_card
    @current_card = deck.sample
  end


end
