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
end
