class PathToPrincess1

  def find_character_location(grid, character)
    vertical_index = grid.find_index { |row| row.include?(character) }
    horizontal_index = grid[vertical_index].index(character)
    [vertical_index, horizontal_index]
  end
end
