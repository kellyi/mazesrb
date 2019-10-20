# frozen_string_literal: true

require "grid"
require "sidewinder"

grid = Grid.new(10, 10)
Sidewinder::generate_maze!(grid)

img = grid.to_png
img.save "sidewinder_maze.png"

puts grid
