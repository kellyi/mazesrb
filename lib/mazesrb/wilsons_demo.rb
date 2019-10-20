# frozen_string_literal: true

require "grid"
require "wilsons"

grid = Grid.new(20, 20)
Wilsons.on(grid)

filename = "wilsons.png"
grid.to_png.save(filename)
puts "Saved to #{filename}"
