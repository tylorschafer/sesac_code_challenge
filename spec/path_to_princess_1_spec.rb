require 'spec_helper'

RSpec.describe 'PathToPrincess1' do
  before :each do
    @game = PathToPrincess1.new
  end

  describe '#find_character_location' do
    it 'Finds the index of both array dimensions' do
      grid = [['p','-','-'], ['-','m','-'], ['-','-','-']]

      expect(@game.find_character_location(grid, 'm')).to eq([1,1])
      expect(@game.find_character_location(grid, 'p')).to eq([0,0])

      grid = [['-','-','-'], ['m','-','-'], ['-','-','p']]

      expect(@game.find_character_location(grid, 'm')).to eq([1,0])
      expect(@game.find_character_location(grid, 'p')).to eq([2,2])
    end
  end

  describe '#find_steps' do
    it 'Outputs the number of vertical and horizontal steps to get to peach' do
      grid = [['-','-','-'], ['-','m','-'], ['p','-','-']]
      mario = @game.find_character_location(grid, 'm')
      peach = @game.find_character_location(grid, 'p')

      expect(@game.find_steps(mario, peach)).to eq([-1,1])

      grid = [['m','-','-'], ['-','-','-'], ['-','-','p']]
      mario = @game.find_character_location(grid, 'm')
      peach = @game.find_character_location(grid, 'p')

      expect(@game.find_steps(mario, peach)).to eq([-2,-2])
    end
  end

  describe '#take_steps' do
    it 'Outputs the directions for each step' do
      grid = [['-','m','-'], ['-','-','-'], ['p','-','-']]
      mario = @game.find_character_location(grid, 'm')
      peach = @game.find_character_location(grid, 'p')
      steps = @game.find_steps(mario, peach)

      expect(@game.take_steps(steps)).to eq("DOWN\nDOWN\nLEFT\n")

      grid = [['-','-','p'], ['-','-','-'], ['m','-','-']]
      mario = @game.find_character_location(grid, 'm')
      peach = @game.find_character_location(grid, 'p')
      steps = @game.find_steps(mario, peach)

      expect(@game.take_steps(steps)).to eq("UP\nUP\nRIGHT\nRIGHT")
    end
  end
end
