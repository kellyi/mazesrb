# frozen_string_literal: true

# Another maze creation algorithm
class AldousBroder
  def self.on(grid)
    cell = grid.random_cell
    unvisited = grid.size.pred

    while unvisited > 0
      neighbor = cell.neighbors.sample

      if neighbor.links.empty?
        cell.link(neighbor)
        unvisited = unvisited.pred
      end

      cell = neighbor
    end

    grid
  end
end
