# frozen_string_literal = true

# another maze generation algorithm
module HuntAndKill
  def HuntAndKill.generate_maze!(grid)
    current = grid.random_cell
    has_any_links = lambda { |n| n.links.any? }

    while current
      unvisited_neighbors = current.neighbors.reject(&has_any_links)

      if unvisited_neighbors.any?
        neighbor = unvisited_neighbors.sample
        current.link(neighbor)
        current = neighbor
      else
        current = nil

        grid.each_cell do |cell|
          visited_neighbors = cell.neighbors.select(&has_any_links)
          if cell.links.empty? && visited_neighbors.any?
            current = cell
            neighbor = visited_neighbors.sample
            current.link(neighbor)

            break
          end
        end
      end
    end

    grid
  end
end
