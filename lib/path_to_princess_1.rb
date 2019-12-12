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
    steps.each do |direction, count|
      unless count == 0
        if direction == :vertical
          moves = { plus: "UP\n", minus: "DOWN\n" }
        else
          moves = { plus: "LEFT\n", minus: "RIGHT\n" }
        end
        output << (count > 0 ? moves[:plus] * count : moves[:minus] * count.abs)
      end
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
