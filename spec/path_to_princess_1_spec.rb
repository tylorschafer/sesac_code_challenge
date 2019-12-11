require 'spec_helper'

RSpec.describe 'PathToPrincess1' do
  before :each do
    @game = PathToPrincess1.new
  end

  describe '#find_character_location' do
    it 'Finds the index of both array dimensions' do
      grid = [['p','-','-'], ['-','m','-'], ['-','-','-']]

      expect(@game.find_character_location(grid, 'm')).to eq({ vertical: 1, horizontal: 1})
      expect(@game.find_character_location(grid, 'p')).to eq({ vertical: 0, horizontal: 0 })

      grid = [['-','-','-'], ['m','-','-'], ['-','-','p']]

      expect(@game.find_character_location(grid, 'm')).to eq({ vertical: 1, horizontal: 0 })
      expect(@game.find_character_location(grid, 'p')).to eq({ vertical: 2, horizontal: 2 })
    end
  end

  describe '#find_steps' do
    it 'Outputs the number of vertical and horizontal steps to get to peach' do
      grid = [['-','-','-'], ['-','m','-'], ['p','-','-']]
      mario = @game.find_character_location(grid, 'm')
      peach = @game.find_character_location(grid, 'p')

      expect(@game.find_steps(mario, peach)).to eq({ vertical: -1,horizontal: 1 })

      grid = [['m','-','-'], ['-','-','-'], ['-','-','p']]
      mario = @game.find_character_location(grid, 'm')
      peach = @game.find_character_location(grid, 'p')

      expect(@game.find_steps(mario, peach)).to eq({ vertical: -2,horizontal: -2 })
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

      expect(@game.take_steps(steps)).to eq("UP\nUP\nRIGHT\nRIGHT\n")
    end
  end

  describe '#displayPathtoPrincess' do
    it 'Uses all previous helper methods to output the correctly formatted steps' do
      grid = [['-','m','-'], ['-','-','-'], ['p','-','-']]
      expect(@game.displayPathtoPrincess(3, grid)).to eq("DOWN\nDOWN\nLEFT\n")

      grid = [['-','m','-','-','-'], ['-','-','-','-','-'], ['-','-','-','-','p'], ['-','-','-','-','-'], ['-','-','-','-','-']]
      expect(@game.displayPathtoPrincess(5, grid)).to eq("DOWN\nDOWN\nRIGHT\nRIGHT\nRIGHT\n")
    end
  end
end
