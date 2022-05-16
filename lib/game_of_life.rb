# frozen_string_literal: true

require './board'

class Game
  # live = "*"
  # dead = "."
  def initialize(rows = 0, cols = 0)
    @matrix = []
    @board = Board.new(rows, cols)
  end

  def start
    input_width
    input_height
    @board.print_matrix
    2.times do |_|
      next_generation
      @board.print_matrix
      sleep(1)
      puts
    end
  end

  def input_width
    puts 'Colocar el ancho'
    @rows = gets.chomp.to_i
  end

  def input_height
    puts 'Colocar el alto'
    @cols = gets.chomp.to_i
  end

  # def initial_cells
  #   middle_row = @width / 2
  #   middle_col = @height / 2
  #   @matrix[middle_row][middle_col] = true
  #   @matrix[middle_row - 1][middle_col] = true
  #   @matrix[middle_row + 1][middle_col] = true
  #   @matrix[middle_row][middle_col - 1] = true
  #   @matrix[middle_row - 1][middle_col + 1] = true
  # end

  # first generation
  def next_generation
    snapshot = @board.snapshot
    width_real = @rows - 1
    height_real = @cols - 1
    snapshot.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        next if i.zero? || j.zero? || i == height_real || j == width_real # Evitar iterar en las orillas de la matrix.

        alive_neighbours_count = snapshot.alive_neighbours_count(i, j)
        cell.next_state(alive_neighbours_count)
      end
    end
  end

  def alive_neighbours_count(snapshot, row, col)
    count = 0
    [row - 1, row, row + 1].each do |i|
      [col - 1, col, col + 1].each do |j|
        next if i == row && j == col

        count += 1 if snapshot[i][j] == true
      end
    end
    count
  end
end

new_game = Game.new(5, 6)
new_game.start
