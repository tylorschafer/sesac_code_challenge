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
end
