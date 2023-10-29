# game_spec.rb

require_relative '../game'

require 'date'

RSpec.describe Game do
  let(:today) { Date.new(2023, 1, 1) }

  describe '#initialize' do
    it 'creates a new game with title, publish_date, last_played_at, and multiplayer' do
      game = Game.new('game_title', 'Action', 'John Doe', 'Steam', 'Awesome Label', '2023-01-01', '2020-01-01', true)
      expect(game.title).to eq('game_title')
      expect(game.publish_date).to eq('2023-01-01')
      expect(game.last_played_at).to eq('2020-01-01')
      expect(game.multiplayer).to be true
    end
  end

  describe '#can_be_archived?' do
    it 'returns true for an old game that was last played more than 2 years ago' do
      game = Game.new('Sample Game', 'Action', 'John Doe', 'Steam', 'Awesome Label', '2023-01-01', '2020-01-01', true)
      expect(game.can_be_archived?).to be true
    end

    it 'returns false for a new game' do
      game = Game.new('New Game', 'Adventure', 'Alice Smith', 'Epic Games', 'Fantastic Label', '2023-01-01',
                      '2023-01-01', false)
      expect(game.can_be_archived?).to be false
    end

    it 'returns false for a recent game' do
      game = Game.new('Recent Game', 'RPG', 'Bob Johnson', 'Origin', 'Great Label', '2023-01-01', '2022-01-01', true)
      expect(game.can_be_archived?).to be false
    end
  end
end
