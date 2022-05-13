require_relative 'game_of_life'

tablero = Game.new(5,5)
tablero.create_matrix
#tablero.initial_cells
tablero.print_matrix

2.times do |_|
  tablero.next_generation
  tablero.print_matrix
  sleep(1)
  puts
end
