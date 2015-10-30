require_relative "board.rb"

class Tile

  attr_reader :bomb

  def initialize(board, pos, bomb = false)
    @board = board
    @pos = pos
    @bomb = bomb
    @flagged = false
    @revealed = false
  end

  def reveal
    @revealed = true unless @flagged

  end

  def neighbors
    near_tiles = []
    (-1..1).each do |row|
      (-1..1).each do |col|
        new_pos = [@pos[0] + row, @pos[1] + col]
        # don't add off board
        near_tiles << new_pos unless new_pos == @pos
      end
    end
    near_tiles
  end


end
