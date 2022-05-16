# frozen_string_literal: true

require './board'

class Game
  def initialize(rows = 0, cols = 0)
    @rows = rows
    @cols = cols
    @board = Board.new(rows, cols)
    initial_cells
  end

  def start
    @board.print_matrix
    10.times do |_|
      next_generation
      @board.print_matrix
      sleep(1)
    end
  end

  def initial_cells
    middle_row = @rows / 2
    middle_col = @cols / 2
    @board[middle_row, middle_col].vivify
    @board[middle_row - 1, middle_col].vivify
    @board[middle_row + 1, middle_col].vivify
    @board[middle_row, middle_col - 1].vivify
    @board[middle_row - 1, middle_col + 1].vivify
  end

  def next_generation
    snapshot = @board.snapshot
    @board.matrix.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        alive_neighbours_count = snapshot.alive_neighbours_count(i, j)
        cell.next_state(alive_neighbours_count)
      end
    end
  end
end

rows = ARGV[0]
cols = ARGV[1]

new_game = Game.new(rows.to_i, cols.to_i)
new_game.start
