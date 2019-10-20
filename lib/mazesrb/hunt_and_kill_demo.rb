# frozen_string_literal: true

require "grid"
require "hunt_and_kill"

grid = Grid.new(20, 20)
HuntAndKill::generate_maze!(grid)

filename = "hunt_and_kill.png"
grid.to_png.save(filename)
puts "Saved to #{filename}"
