# frozen_string_literal: true

require_relative "./distances"

# Represents cells within a maze grid
class Cell
  attr_reader :row, :column
  attr_accessor :north, :south, :east, :west

  def initialize(row, column)
    @row = row
    @column = column
    @links = {}
  end

  def link(cell, bidi = true)
    @links[cell] = true
    cell.link(self, false) if bidi
    self
  end

  def unlink(cell, bidi = true)
    @links.delete(cell)
    cell.unlink(self, false) if bidi
    self
  end

  def links
    @links.keys
  end

  def linked?(cell)
    @links.key?(cell)
  end

  def neighbors
    [north, south, east, west].compact
  end

  def distances
    distances = Distances.new(self)
    frontier = [self]

    while frontier.any?
      new_frontier = []
      frontier.each do |cell|
        cell.links.each do |linked|
          next if distances[linked]

          distances[linked] = distances[cell] + 1
          new_frontier << linked
        end
      end

      frontier = new_frontier
    end

    distances
  end
end
