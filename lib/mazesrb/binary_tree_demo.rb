# frozen_string_literal: true

require "grid"
require "binary_tree"

grid = Grid.new(10, 10)
BinaryTree::generate_maze!(grid)

img = grid.to_png
img.save "binary_tree_maze.png"

puts grid
