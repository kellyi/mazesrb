# frozen_string_literal: true

require "colored_grid"
require "sidewinder"

grid = ColoredGrid.new(25, 25)
Sidewinder.on(grid)

start = grid[grid.rows / 2, grid.columns / 2]
grid.distances = start.distances

filename = "colorized_grid.png"
grid.to_png.save(filename)

puts "Saved to #{filename}"
