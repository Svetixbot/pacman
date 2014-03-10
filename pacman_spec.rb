require "minitest/spec"
require "minitest/autorun"
require './pacman'

describe 'next_step' do
  before(:each) do
    @pacman = Pacman.new
  end

  it 'goes nowhere when it is nowhere to go' do
    @pacman.next_step({}).must_equal [] 
  end
  
  it 'goes to the first available empty spot' do
    @pacman.next_step([0,0] => :pacman, [0,1] => :empty).must_equal [0,1]
  end
  
  it 'runs away from a blinky' do
    @pacman.next_step([0,0] => :empty, [0,1] => :pacman, [0,2] => :blinky).must_equal [0,0]
  end

  it 'cant jump over positions' do
    @pacman.next_step([0,0] => :empty, [0,1] => :pacman, [0,3] => :empty, [0,2] => :empty, [0,4] => :empty).must_equal [0,2]
  end

end
