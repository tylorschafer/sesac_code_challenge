class PathToPrincess1

  def find_character_location(grid, character)
    vertical_index = grid.find_index { |row| row.include?(character) }
    horizontal_index = grid[vertical_index].index(character)
    { vertical: vertical_index, horizontal: horizontal_index }
  end

  def find_steps(hero, damsel)
    vertical = hero[:vertical] - damsel[:vertical]
    horizontal = hero[:horizontal] - damsel[:horizontal]
    { vertical: vertical, horizontal: horizontal }
  end

  def take_steps(steps)
    output = ''
    unless steps[:vertical] == 0
      count = steps[:vertical]
      output << (count > 0 ? "UP\n" * count : "DOWN\n" * count.abs)
    end
    unless steps[:horizontal] == 0
      count = steps[:horizontal]
      output << (count > 0 ? "LEFT\n" * count : "RIGHT\n" * count.abs)
    end
    output
  end

  def displayPathtoPrincess(n, grid)
    mario = find_character_location(grid, 'm')
    peach = find_character_location(grid, 'p')
    steps = find_steps(mario, peach)
    puts take_steps(steps)
    return take_steps(steps)
  end
end
