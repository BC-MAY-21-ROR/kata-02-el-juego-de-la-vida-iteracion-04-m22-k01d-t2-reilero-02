X = '.'
O = '*'

class Board
    def print_matrix
        is_alive = false
        @matrix.each do |row|
          row.each do |cell|
            if cell == true
              print '*'
            else
              print '.'
            end
          end
          puts
        end
      end
  
      def matrix_snapshot
        snapshot = []
        snapshot_done = false
        @matrix.each_with_index do |row, i|
          snapshot << []
          row.each do |cell|
            snapshot[i] << cell
          end
        end
        snapshot
      end
end