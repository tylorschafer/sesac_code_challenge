require './modules/step_finder'

class PathToPrincess1
  include StepFinder

  def takeSteps(steps)
    output = steps.map do |direction, count|
      unless count == 0
        if direction == :vertical
          moves = { plus: "UP\n", minus: "DOWN\n" }
        else
          moves = { plus: "LEFT\n", minus: "RIGHT\n" }
        end
        (count > 0 ? moves[:plus] * count : moves[:minus] * count.abs)
      end
    end
    output.join('')
  end

  def displayPathtoPrincess(n, grid)
    mario = findCharacterLocation(grid, 'm')
    peach = findCharacterLocation(grid, 'p')
    steps = findSteps(mario, peach)
    puts takeSteps(steps)
    return takeSteps(steps)
  end
end
