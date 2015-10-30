require_relative 'tile.rb'

class Board

  def initialize
    @length = 9
    @num_bombs = 10
    @board = create_board
  end

  def create_board
    board = Array.new(@length) {Array.new(@length)}
    board.each_index do |row|
      board[row].each_index do |col|
        #p "row #{row}, col #{col}"
        board[row][col] = Tile.new([row,col], self)
      end
    end
    board
  end

  def to_s
    @board.each do |row|
      p row.map { |tile| tile.bomb}
    end
  end



end


b = Board.new
b.create_board
puts b
