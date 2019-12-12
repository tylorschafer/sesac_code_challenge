require 'spec_helper'

RSpec.describe 'PathToPrincess1' do
  before :each do
    @game = PathToPrincess1.new
  end

  describe '#find_character_location' do
    it 'Finds the index of both array dimensions' do
      grid = [['p','-','-'], ['-','m','-'], ['-','-','-']]

      expect(@game.findCharacterLocation(grid, 'm')).to eq({ vertical: 1, horizontal: 1})
      expect(@game.findCharacterLocation(grid, 'p')).to eq({ vertical: 0, horizontal: 0 })

      grid = [['-','-','-'], ['m','-','-'], ['-','-','p']]

      expect(@game.findCharacterLocation(grid, 'm')).to eq({ vertical: 1, horizontal: 0 })
      expect(@game.findCharacterLocation(grid, 'p')).to eq({ vertical: 2, horizontal: 2 })
    end
  end

  describe '#find_steps' do
    it 'Outputs the number of vertical and horizontal steps to get to peach' do
      grid = [['-','-','-'], ['-','m','-'], ['p','-','-']]
      mario = @game.findCharacterLocation(grid, 'm')
      peach = @game.findCharacterLocation(grid, 'p')

      expect(@game.findSteps(mario, peach)).to eq({ vertical: -1,horizontal: 1 })

      grid = [['m','-','-'], ['-','-','-'], ['-','-','p']]
      mario = @game.findCharacterLocation(grid, 'm')
      peach = @game.findCharacterLocation(grid, 'p')

      expect(@game.findSteps(mario, peach)).to eq({ vertical: -2,horizontal: -2 })
    end
  end

  describe '#take_steps' do
    it 'Outputs the directions for each step' do
      grid = [['-','m','-'], ['-','-','-'], ['p','-','-']]
      mario = @game.findCharacterLocation(grid, 'm')
      peach = @game.findCharacterLocation(grid, 'p')
      steps = @game.findSteps(mario, peach)

      expect(@game.takeSteps(steps)).to eq("DOWN\nDOWN\nLEFT\n")

      grid = [['-','-','p'], ['-','-','-'], ['m','-','-']]
      mario = @game.findCharacterLocation(grid, 'm')
      peach = @game.findCharacterLocation(grid, 'p')
      steps = @game.findSteps(mario, peach)

      expect(@game.takeSteps(steps)).to eq("UP\nUP\nRIGHT\nRIGHT\n")
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
