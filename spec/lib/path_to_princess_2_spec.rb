require 'spec_helper'

RSpec.describe 'PathToPrincess2' do
  before :each do
    @game = PathToPrincess2.new
  end

  describe '#nextMove' do
    it 'Uses all module helper methods to output the next formatted step mario must take' do
      grid = [
                ['-','m','-','-','-'],
                ['-','-','-','-','-'],
                ['-','-','-','-','p'],
                ['-','-','-','-','-'],
                ['-','-','-','-','-']
              ]
      expect(@game.nextMove(5, 0, 1, grid)).to eq("DOWN\n")

      grid = [
                ['-','-','-','-','-'],
                ['-','p','-','-','-'],
                ['-','-','-','-','-'],
                ['-','m','-','-','-'],
                ['-','-','-','-','-']
              ]
      expect(@game.nextMove(5, 3, 1, grid)).to eq("UP\n")

      grid = [
                ['-','-','-','-','-'],
                ['-','p','-','m','-'],
                ['-','-','-','-','-'],
                ['-','-','-','-','-'],
                ['-','-','-','-','-']
              ]
      expect(@game.nextMove(5, 1, 3, grid)).to eq("LEFT\n")

      grid = [
                ['-','-','-','-','-'],
                ['-','m','-','p','-'],
                ['-','-','-','-','-'],
                ['-','-','-','-','-'],
                ['-','-','-','-','-']
              ]
      expect(@game.nextMove(5, 1, 1, grid)).to eq("RIGHT\n")
    end
  end
end
