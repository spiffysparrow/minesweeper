require_relative 'tile.rb'

class Board

  attr_reader :length, :board

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
    choose_bombs.each do |position_array|
      row = position_array[0]
      col = position_array[1]
      board[row][col].bomb = true
    end


    board
  end

  def choose_bombs
    rand_positions = []
    @num_bombs.times do
      rand_position = [rand(0...@length),rand(0...@length)]
      while rand_positions.include?(rand_position)
        rand_position = [rand(0...@length),rand(0...@length)]
      end
      rand_positions << rand_position
    end
    rand_positions
  end

  def display
    @board.each do |row|
      p row.map { |tile| tile.bomb ? "x" : "_"}
    end
  end

end

b = Board.new
p b.board[0][0]
