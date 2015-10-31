class Tile

  attr_accessor :bomb

  def initialize(pos, board, bomb = false)
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
        unless new_pos.any? { |el| el > @board.length || el < 0}
          near_tiles << new_pos unless new_pos == @pos
        end
      end
    end
    near_tiles
  end

  def inspect
    # "[Tile pos=#{@pos}, bomb=#{@bomb}, flagged=#{@flagged}, revealed=#{@revealed}]"
    "[ TILE pos=#{@pos}, bomb=#{@bomb}]"
  end


end


t = Tile.new([9,6],9)
