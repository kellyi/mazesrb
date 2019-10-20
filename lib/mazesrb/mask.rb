# frozen_string_literal: true

# a mask over a grid
class Mask
  attr_reader :rows, :columns

  def self.from_txt(file)
    lines = File.readlines(file).map(&:strip)
    lines.pop while lines.last.length < 1
    rows = lines.length
    columns = lines.first.length
    mask = Mask.new(rows, columns)

    mask.rows.times do |row|
      mask.columns.times do |col|
        if lines[row][col] == "X"
          mask[row, col] = false
        else
          mask[row, col] = true
        end
      end
    end

    mask
  end

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @bits = Array.new(@rows) { Array.new(@columns, true) }
  end

  def [](row, column)
    if row.between?(0, @rows.pred) && column.between?(0, @columns.pred)
      @bits[row][column]
    else
      false
    end
  end

  def []=(row, column, is_on)
    @bits[row][column] = is_on
  end

  def count
    reducer = lambda { |acc, next_val| acc + (next_val && 1 || 0) }

    @rows.inject(0) do |row_acc, next_row|
      row_sum = next_row.inject(0) &reducer
      row_acc + row_sum
   end
  end

  def random_location
    loop do
      row = rand(@rows)
      col = rand(@columns)

      return [row, col] if @bits[row][col]
    end
  end
end
