RSpec.describe Mazesrb do
  it "has a version number" do
    expect(Mazesrb::VERSION).not_to be nil
  end

  it "generates a grid" do
    require_relative "../lib/mazesrb/grid"
    grid = Grid.new(5, 5)
    expect(grid.random_cell).not_to be nil
  end

  it "runs each algorithm" do
    require_relative "../lib/mazesrb/grid"
    require_relative "../lib/mazesrb/binary_tree"
    require_relative "../lib/mazesrb/sidewinder"
    require_relative "../lib/mazesrb/aldous_broder"
    require_relative "../lib/mazesrb/wilsons"
    require_relative "../lib/mazesrb/hunt_and_kill"
    require_relative "../lib/mazesrb/recursive_backtracker"

    [BinaryTree, Sidewinder, AldousBroder, Wilsons, HuntAndKill, RecursiveBacktracker].each do |algorithm|
      grid = Grid.new(20, 20)
      expect(grid.deadends.count).to be 0

      algorithm::generate_maze!(grid)
      expect(grid.deadends.count).not_to be 0
    end
  end
end
