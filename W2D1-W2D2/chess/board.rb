require_relative 'piece'
require_relative 'nullpiece'

class Board

  def initialize
    @grid = Array.new(8){Array.new(8)}
  end

  def populate
    @grid.each.with_index do |row, row_idx|
    populated_rows = [0, 1, 6, 7]
      if populated_rows.include?(row_idx)
        row.map! { |space| space = Piece.new}
      else
        row.map! { |space| space = NullPiece.new}
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    start_piece = self[start_pos]
    end_piece = self[end_pos]

    if start_piece.is_a?(Piece) && end_piece.is_a?(NullPiece)
      self[end_pos] = start_piece
      self[start_pos] = end_piece
    else
      raise ArgumentError "Invalid move!"
    end
  end

  def display
    @grid.each do |row|
      p row
    end
  end

  def in_bounds
  end

end

b = Board.new
b.populate
b.move_piece([0,0], [0,5])
b.display
