require 'spec_helper'

describe Bowling do

  describe "#score" do
    
    subject(:game) { Bowling.new }

    it 'returns 0 for all gutter game' do
      20.times { game.roll(0) }
      expect(game.score).to eq 0
    end

    it 'returns 20 for all one game' do
      20.times { game.roll(1) }
      expect(game.score).to eq 20
    end

    it 'returns 14 for one spare and next roll 2 pins' do
      game.roll(5)
      game.roll(5)
      game.roll(2)
      17.times { game.roll(0) }
      expect(game.score).to eq 14
    end

    it 'returns 18 for one strike and next frame 4 pins' do
      game.roll(10)
      game.roll(2)
      game.roll(2)
      16.times { game.roll(0) }
      expect(game.score).to eq 18
    end

    it 'returns 40 for two strikes and next frame 4 pins' do
      game.roll(10)
      game.roll(10)
      game.roll(2)
      game.roll(2)
      14.times { game.roll(0) }
      expect(game.score).to eq 40
    end

    it 'returns 300 for all strikes' do
      12.times { game.roll(10) }
      expect(game.score).to eq 300
    end
  end
end
