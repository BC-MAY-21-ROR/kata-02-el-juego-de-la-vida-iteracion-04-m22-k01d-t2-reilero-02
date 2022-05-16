# frozen_string_literal: true
require './cell'

X = '.'
O = '*'

class Board
  def initialize(rows = 10, cols = 10, initial_state = nil)
    @rows = rows
    @cols = cols
    @matrix = []
    @initial_state = initial_state
    if initial_state.nil?
      create_board(rows, cols)
    else
      create_board(initial_state.length, initial_state[0].length)
      initialize_board(initial_state)
    end
  end

  def initialize_board(initial_state)
    initial_state.each_with_index do |rows, idx_rows|
      rows.each_with_index do |cel, idx_cols|
        @matrix[idx_rows][idx_cols].vivify if cel == O
      end
    end
  end

  def create_board(rows, cols)
    @matrix = Array.new(rows) { Array.new(cols) { Cell.new } }
  end

  def print_matrix
    @matrix.each do |row|
      row.each do |cell|
        if cell.alive?
          print '*'
        else
          print '.'
        end
      end
      puts
    end
  end

  def snapshot
    board = Board.new(@rows, @cols)
    @matrix.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        board.get_matrix[i][j] = cell.copy
      end
    end
    board
  end

  def get_matrix
    @matrix
  end
end
