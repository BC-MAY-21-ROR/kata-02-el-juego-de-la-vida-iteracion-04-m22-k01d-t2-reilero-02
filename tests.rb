require 'rspec'
require_relative './lib/game_of_life'

describe Game do
    describe '.create_matrix' do
        it 'should create matrix' do
            matrix=Game.new(5,5)
            expect(matrix.create_matrix.length).to eq(5) 
        end
    end

    # describe '.alive_neighbours_count' do
    #     it 'should return count of neighbours' do
    #         matriz = Game.new(5,5)
    #         count=matriz.alive_neighbours_count(matriz.create_matrix,5,5)
    #         expect(count).to eq(count>=0||count<=8)
    #     end
    # end

    describe '.input_width' do
        it 'should return width' do
             matriz = Game.new(5,5)
             width=matriz.input_width
             expect(width).to eq(0)
         end
     end

     describe '.input_height' do
      it 'should return height' do
           matriz = Game.new(5,5)
           height=matriz.input_height
           expect(height).to eq(0)
       end
   end
      
end