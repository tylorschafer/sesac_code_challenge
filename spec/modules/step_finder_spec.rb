require 'spec_helper'

RSpec.describe 'StepFinder' do
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

  describe '#findMoveDirections' do
    it 'Outputs the possible physical directions based X / Y axis argument' do
      expect(@game.findMoveDirections(:vertical)).to eq({ plus: "UP\n", minus: "DOWN\n" })
      expect(@game.findMoveDirections(:horizontal)).to eq({ plus: "LEFT\n", minus: "RIGHT\n" })
    end
  end

  describe '#directions' do
    it 'Outputs an array of all upcoming moves based on numerical steps' do
      steps = { vertical: 1, horizontal: -1 }
      steps2 = { vertical: 0, horizontal: 2 }
      steps3 = { vertical: 3, horizontal: 0 }

      expect(@game.directions(steps)).to eq(["UP\n", "RIGHT\n"])
      expect(@game.directions(steps2)).to eq(["LEFT\n", "LEFT\n"])
      expect(@game.directions(steps3)).to eq(["UP\n", "UP\n", "UP\n",])
    end
  end
end
