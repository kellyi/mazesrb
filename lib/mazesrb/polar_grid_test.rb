# frozen_string_literal: true

require "polar_grid"
require "recursive_backtracker"

grid = PolarGrid.new(20, 20)
RecursiveBacktracker::generate_maze!(grid)

filename = "polar_grid.png"
grid.to_png.save(filename)
puts "Saved grid to #{filename}"
