require 'rspec'
require 'board'

describe Board do
  subject { Board.new }

  it 'should return alive neighbours count' do
    initial_state = [
      [X, X, X],
      [X, O, X],
      [X, X, X]
    ]

    subject(initial_state)

    expect(subject.alive_neighbours(1, 1)).to eq(0)
  end

  describe '.print_matrix' do
    it 'returns true when first generation is alive' do
      expect(subject.print_matrix.is_alive).to eq(true)
    end
  end

  describe '.matrix_snapshot' do
    it 'returns true when the snapshot of the matrix is ready' do
      expect(subject.matrix_snapshot.snapshot_done).to eq(true)
    end
  end
end
