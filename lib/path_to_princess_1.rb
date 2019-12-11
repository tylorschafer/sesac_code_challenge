class PathToPrincess1

  def find_character_location(grid, character)
    vertical_index = grid.find_index { |row| row.include?(character) }
    horizontal_index = grid[vertical_index].index(character)
    [vertical_index, horizontal_index]
  end

  def find_steps(hero, damsel)
    vertical = hero[0] - damsel[0]
    horizontal = hero[1] - damsel[1]
    [vertical, horizontal]
  end

  def take_steps(steps)
    output = ''
    unless steps[0] == 0
      output << (steps[0] > 0 ? "UP\n" * steps[0] : "DOWN\n" * steps[0].abs)
    end
    unless steps[1] == 0
      output << (steps[1] > 0 ? "LEFT\n" * steps[1] : "RIGHT\n" * steps[1].abs)
    end
    output
  end

  def displayPathtoPrincess(n, grid)
    mario = find_character_location(grid, 'm')
    peach = find_character_location(grid, 'p')
    steps = find_steps(mario, peach)
    take_steps(steps)
  end
end
