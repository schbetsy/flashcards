
$LOAD_PATH << './'

require 'flashcard_model.rb'

test_game = Game.new("flashcard_samples.csv")

test_game.load_cards!

puts test_game.entire_deck