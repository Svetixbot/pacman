require 'minitest/spec'
require 'minitest/autorun'
require './game'

describe 'game' do
	
	before(:each) do
		@game = Game.new ({[0,0] => :wall,
								 [0,1] => :pacman, 
								 [0,2] => :pellet, 
								 [0,3] => :pellet})
	end

	describe 'pacman_makes_a_move' do

		it 'places pacman to a 1,0 position in a pacmans world' do	
			@game.pacman_makes_a_move [0,2]
			@game.pacmans_world[[0,2]].must_equal :pacman
		end

		it 'lets pacman eat a pellet' do
			@game.pacman_makes_a_move [0,2]
			@game.pacman_makes_a_move [0,3]
			@game.pacmans_world[[0,2]].must_equal :empty
		end

		it 'doesnt allow pacman to travel through the walls' do
			@game.pacman_makes_a_move [0,0]
			@game.pacmans_world[[0,0]].must_equal :wall
			@game.pacmans_world[[0,1]].must_equal :pacman
		end

		it 'does not allow pacman to jump over spots' do
			@game.pacman_makes_a_move [0,3]
			@game.pacmans_world[[0,1]].must_equal :pacman
			@game.pacmans_world[[0,3]].must_equal :pellet
		end

		it 'does not allow pacman to go outside of pacmans world' do
			@game.pacman_makes_a_move [1,1]
			@game.pacmans_world[[0,1]].must_equal :pacman
		end

		it 'does not allow pacman to go diagonal' do
			@game.pacmans_world.merge! [1,0] => :wall,
									   [1,1] => :pellet, 
									   [1,2] => :pellet, 
									   [1,3] => :pellet
			@game.pacman_makes_a_move [1,2]
			@game.pacmans_world[[1,2]].must_equal :pellet
			@game.pacmans_world[[0,1]].must_equal :pacman						   

		end
	end	

	describe 'game keeps a pacmans score' do
		it 'makes score to be zero on game start' do
			@game.pacmans_score.must_equal 0
		end
		it 'increments score when pacman eats a pellet' do
			@game.pacman_makes_a_move [0,2]
			@game.pacmans_score.must_equal 1
		end
		it 'keeps score unchaged if pacman made a move to an empty spot' do
			@game.pacmans_world[[0,2]] = :empty
			@game.pacman_makes_a_move [0,2]
			@game.pacmans_score.must_equal 0
		end
	end

end