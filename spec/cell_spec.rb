require 'rspec'
require 'cell'

describe Cell do
  subject { Cell.new } 

  it 'should live if dead and 3 neigbours' do
    subject.next_state(3)
    expect(subject.alive?).to eq(true)
  end

  it 'should die if less than 2 alive neighbours' do
    subject.vivify
    subject.next_state(1)
    expect(subject.alive?).to eq(false)
  end

  it 'should die by overpopulation' do 
    subject.vivify
    subject.next_state(6)
    expect(subject.alive?).to eq(false)
  end

  it 'if is dead should not become alive' do
   subject.next_state(2)
   expect(subject.dead?).to eq(true)
  end

end
