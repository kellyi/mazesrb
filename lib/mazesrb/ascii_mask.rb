# frozen_string_literal: true

require "mask"
require "masked_grid"
require "recursive_backtracker"

abort "Please specify a text file to use as a template" if ARGV.empty?

mask = Mask.from_txt(ARGV.first)
grid = MaskedGrid.new(mask)
RecursiveBacktracker::generate_maze!(grid)

filename = "masked.png"
grid.to_png.save(filename)

puts "Saved image to #{filename}"
