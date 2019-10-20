# frozen_string_literal: true

require "recursive_backtracker"
require "grid"

grid = Grid.new(20, 20)
RecursiveBacktracker.on(grid)

filename = "recursive_backtracker.png"
grid.to_png.save(filename)
puts "Saved to #{filename}"
