# frozen_string_literal: true

require 'grid'
require 'recursive_backtracker'

grid = Grid.new(5, 5)

grid[0, 0].east.west = nil
grid[0, 0].south.north = nil

grid[4, 4].west.east = nil
grid[4, 4].north.south = nil

RecursiveBacktracker::generate_maze!(grid)

puts grid
