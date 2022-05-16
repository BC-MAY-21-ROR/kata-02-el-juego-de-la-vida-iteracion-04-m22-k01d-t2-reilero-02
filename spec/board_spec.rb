require 'board'

describe Board do
  it 'should return alive neighbours count' do
    initial_state = [
      [X, X, X],
      [X, O, X],
      [X, X, X]
    ]

    board = Board.new(initial_state)

    expect(board.alive_neighbours(1, 1)).to eq(0)
  end
end
