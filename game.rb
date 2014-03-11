class Game
	attr_accessor :pacmans_world, :pacmans_score

	def initialize pacmans_world
		@pacmans_world = pacmans_world
		@pacmans_score = 0
	end

	def pacman_makes_a_move pacmans_next_step
		return if (pacman_wants_to_jump? pacmans_next_step) || 
						(pacman_wants_to_travel_through_walls? pacmans_next_step)

		make_a_move pacmans_next_step
	end

	def pacman_wants_to_jump? pacmans_next_step
	  	surrounding = get_pacmans_surrounding
	  	!surrounding.include? pacmans_next_step	
	end

	def pacman_wants_to_travel_through_walls? pacmans_next_step
		@pacmans_world[pacmans_next_step] == :wall
	end

	def make_a_move pacmans_next_step
		@pacmans_world.each_key{|position| @pacmans_world[position] = :empty if @pacmans_world[position] == :pacman}
		@pacmans_score =+ 1 if @pacmans_world[pacmans_next_step] == :pellet
		@pacmans_world[pacmans_next_step] = :pacman	
	end

	def get_pacmans_surrounding	
		pacmans_position = get_pacmans_current_position

	  	surrounding = [[pacmans_position], 
	  		[pacmans_position[0], pacmans_position[1]+1],
	  		[pacmans_position[0], pacmans_position[1]-1],
	  		[pacmans_position[0]+1, pacmans_position[1]],
	  		[pacmans_position[0]-1, pacmans_position[1]]]

	    surrounding.select!{|position| @pacmans_world.has_key? position}
	end

	def get_pacmans_current_position
		pacmans_position = []
	  	@pacmans_world.each_pair do |position, holder| 
	  	  pacmans_position = position if holder == :pacman
	  	end
	  	pacmans_position
	end

end