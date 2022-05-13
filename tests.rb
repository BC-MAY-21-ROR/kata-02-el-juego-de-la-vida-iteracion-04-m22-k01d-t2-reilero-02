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

    describe Game do
        describe '#input_width_height' do
          before do
            io_obj = integer
            expect(subject)
              .to receive(:gets)
              .and_return(io_obj)
              .twice
            expect(io_obj)
              .to receive(:to_i)
              .and_return(:width)
            expect(io_obj)
              .to receive(:to_i)
              .and_return(:height)
          end
      
          it 'sets @type and @quantity according to user\'s input' do
            subject.choose
      
            expect(subject.instance_variable_get(:@width)).to eq :width
            expect(subject.instance_variable_get(:@height)).to eq :height
          end
        end
      end

end