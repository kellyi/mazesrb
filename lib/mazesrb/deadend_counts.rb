# frozen_string_literal: true

require "grid"
require "binary_tree"
require "sidewinder"
require "aldous_broder"
require "wilsons"
require "hunt_and_kill"
require "recursive_backtracker"

algorithms = [BinaryTree, Sidewinder, AldousBroder, Wilsons, HuntAndKill, RecursiveBacktracker]

tries = 100
size = 20

averages = {}

algorithms.each do |algorithm|
  puts "Running #{algorithm}"

  deadend_counts = []

  tries.times do
    grid = Grid.new(size, size)
    algorithm::generate_maze!(grid)
    deadend_counts << grid.deadends.count
  end

  total_deadends = deadend_counts.inject(:+)

  averages[algorithm] = total_deadends / deadend_counts.length
end

total_cells = size * size
puts
puts "Average deadends per #{size}x#{size} maze (#{total_cells} cells):"
puts

algorithms.sort_by { |alg| -averages[alg] }.each do |alg|
  percentage = averages[alg] * 100.0 / (size * size)
  puts "%14s : %3d/%d (%d%%)" % [alg, averages[alg], total_cells, percentage]
end
