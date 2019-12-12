require './modules/step_finder'

class PathToPrincess2
  include StepFinder

  def nextMove(n,r,c,grid)
    mario = { vertical: r, horizontal: c }
    peach = findCharacterLocation(grid, 'p')
    steps = findSteps(mario, peach)
    print directions(steps).first
    return directions(steps).first
  end
end
