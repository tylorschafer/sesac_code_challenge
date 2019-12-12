require './modules/step_finder'

class PathToPrincess1
  include StepFinder

  def displayPathtoPrincess(n, grid)
    mario = findCharacterLocation(grid, 'm')
    peach = findCharacterLocation(grid, 'p')
    steps = findSteps(mario, peach)
    puts directions(steps).join('')
    return directions(steps).join('')
  end
end
