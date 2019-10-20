# frozen_string_literal: true

require "grid"
require "aldous_broder"

grid = Grid.new(20, 20)
AldousBroder::generate_maze!(grid)

filename = "aldous_broder.png"
grid.to_png.save(filename)
puts "Saved to #{filename}"
