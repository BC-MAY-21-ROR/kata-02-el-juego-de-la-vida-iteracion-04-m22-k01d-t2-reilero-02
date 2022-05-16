# frozen_string_literal: true
require './cell'

X = '.'
O = '*'

class Board
  attr_reader :matrix

  def initialize(rows = 10, cols = 10, initial_state: nil)
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

  def alive_neighbours_count(row, col)
    count = 0
    [row - 1, row, row + 1].each do |i|
      [col - 1, col, col + 1].each do |j|
        next if i < 0 || i >= @rows 
        next if j < 0 || j >= @cols
        next if i == row && j == col # Evitar que cuente el centre de la submatriz de 3x3s

        count += 1 if @matrix[i][j].alive?
      end
    end
    count
  end

  def [](row, col)
    @matrix[row][col]
  end

  def []=(row, col, value)
    @matrix[row][col] = value
  end

  def print_matrix
    @matrix.each do |row|
      row.each do |cell|
        print cell.to_s
      end
      puts
    end
  end

  def snapshot
    snapshot = Board.new(@rows, @cols)
    @matrix.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        snapshot[i, j] = cell.copy
      end
    end
    snapshot
  end
end
