module StepFinder
  def findCharacterLocation(grid, character)
    vertical_index = grid.find_index { |row| row.include?(character) }
    horizontal_index = grid[vertical_index].index(character)
    { vertical: vertical_index, horizontal: horizontal_index }
  end

  def findSteps(hero, damsel)
    vertical = hero[:vertical] - damsel[:vertical]
    horizontal = hero[:horizontal] - damsel[:horizontal]
    { vertical: vertical, horizontal: horizontal }
  end

  def findMoveDirections(direction)
    if direction == :vertical
      { plus: "UP\n", minus: "DOWN\n" }
    else
      { plus: "LEFT\n", minus: "RIGHT\n" }
    end
  end

  def directions(steps)
    output = []
    steps.each do |direction, count|
      unless count == 0
        moves = findMoveDirections(direction)
        if count > 0
            count.times { output.push(moves[:plus]) }
        else
            count.abs.times { output.push(moves[:minus]) }
        end
      end
    end
    output
  end
end
