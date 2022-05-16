require 'board'

class Game
    #live = "*"
    #dead = "."
    def initialize(width=0, height=0)
        @width = width
        @height = height
        @matrix = []
    end

    def start
     input_width
     input_height
     create_matrix
     print_matrix

     2.times do |_|
        next_generation
        print_matrix
        sleep(1)
        puts
     end
    end

    def input_width
      puts "Colocar el ancho"
      @width = gets.chomp.to_i
      @width
    end

    def input_height
      puts "Colocar el alto"
      @height = gets.chomp.to_i
      @height
    end
    
    def create_matrix
        @matrix = Array.new(@width){Array.new(@height){[true, false].sample}}
    end

    def initial_cells
      middle_row = @width/2
      middle_col = @height/2
      @matrix[middle_row][middle_col] = true
      @matrix[middle_row-1][middle_col] = true
      @matrix[middle_row+1][middle_col] = true
      @matrix[middle_row][middle_col-1] = true
      @matrix[middle_row-1][middle_col+1] = true
    end



    # first generation
    def next_generation
      snapshot = matrix_snapshot
      width_real = @width - 1
      height_real = @height - 1
      @matrix.each_with_index do |row, i|
        row.each_with_index do |cell, j|
          next if i == 0 || j == 0 || i == height_real || j == width_real # Evitar iterar en las orillas de la matrix.
            alive_neighbours_count = alive_neighbours_count(snapshot, i, j)
            game_rules(alive_neighbours_count,i,j)
        end
      end
    end

    def game_rules(alive_neighbours_count,i,j)
      first_rule(alive_neighbours_count, i, j)
      second_rule(alive_neighbours_count, i, j)
      thrid_rule(alive_neighbours_count, i, j)
      fourth_rule(alive_neighbours_count, i, j)
    end

    def first_rule(alive_neighbours_count, row, col)
      if alive_neighbours_count < 2
        @matrix[row][col] = false
      end
    end

    def second_rule(alive_neighbours_count, row, col)
      if alive_neighbours_count > 3
        @matrix[row][col] = false
      end
    end

    def thrid_rule(alive_neighbours_count, row, col)
      if @matrix[row][col] == false
        return
      end
      if alive_neighbours_count == 2 || alive_neighbours_count == 3
        @matrix[row][col] = true
      end
    end

    def fourth_rule(alive_neighbours_count, row, col)
      if alive_neighbours_count == 3
        @matrix[row][col] = true
      end
    end

    def alive_neighbours_count(snapshot, row, col)
      count = 0
      [row-1,row,row+1].each do |i|
        [col-1,col,col+1].each do |j|
          next if i == row && j == col
          if snapshot[i][j] == true
            count += 1
          end
        end
      end
      count
    end
    
end

new_game = Game.new
new_game.start