require 'rspec'
require 'cell'

describe Cell do
  it 'should live if dead and 3 neigbours' do
    cell = Cell.new
    cell.next_state(3)
    expect(cell.alive?).to eq(true)
  end

  it 'should die if less than 2 alive neighbours' do
    cell = Cell.new
    cell.vivify
    cell.next_state(1)
    expect(cell.alive?).to eq(false)
  end

  it 'should die by overpopulation' do 
    cell = Cell.new
    cell.vivify
    cell.next_state(6)
    expect(cell.alive?).to eq(false)
  end

  it 'if is dead should not become alive' do
   cell = Cell.new 
   cell.next_state(2)
   expect(cell.dead?).to eq(true)
  end

end
