require 'spec_helper'

RSpec.describe 'PathToPrincess1' do
  before :each do
    @game = PathToPrincess1.new
  end

  describe '#find_character_location' do
    it 'finds the index of both array dimensions' do
      grid = [['p','-','-'], ['-','m','-'], ['-','-','-']]

      expect(@game.find_character_location(grid, 'm')).to eq([1,1])
      expect(@game.find_character_location(grid, 'p')).to eq([0,0])

      grid = [['-','-','-'], ['m','-','-'], ['-','-','p']]

      expect(@game.find_character_location(grid, 'm')).to eq([1,0])
      expect(@game.find_character_location(grid, 'p')).to eq([2,2])
    end
  end
end
