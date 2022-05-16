require 'rspec'
require 'board'

describe Board do
  subject { Board.new }

  it 'should return alive neighbours count if cell is 1,1' do
    initial_state = [
      [O, X, O],
      [O, X, X],
      [X, O, X]
    ]

    board = Board.new(initial_state: initial_state)

    expect(board.alive_neighbours_count(1, 1)).to eq(4)
  end

  it 'should return alive neighbours if cell is 0,0' do
    initial_state = [
      [O, O, O],
      [O, X, X],
      [X, O, X]
    ]

    board = Board.new(initial_state: initial_state)

    expect(board.alive_neighbours_count(0, 0)).to eq(2)
  end

  it 'should return copy of board' do
   board = Board.new(5, 5)
   snapshot = board.snapshot
   expect(snapshot).not_to be(board)
  end
end
