class Pacman

  def next_step lookout

  	pacmans_next_step = []

  	pacman_surrounds = get_pacman_surrounds lookout

  	pacman_surrounds.each_pair do |position, holder|
  	  pacmans_next_step = position if pacman_surrounds[position] == :empty
  	end

  	pacmans_next_step
  
  end

  def get_pacman_surrounds lookout
  	pacman_surrounds = {}
  	pacman_spot = get_pacman_spot lookout

  	if pacman_spot.length > 0

	  	positions = [[pacman_spot], 
	  		[pacman_spot[0], pacman_spot[1]+1],
	  		[pacman_spot[0], pacman_spot[1]-1],
	  		[pacman_spot[0]+1, pacman_spot[1]],
	  		[pacman_spot[0]-1, pacman_spot[1]],
	  		[pacman_spot[0]+1, pacman_spot[1]+1],
	  		[pacman_spot[0]+1, pacman_spot[1]-1],
	  		[pacman_spot[0]-1, pacman_spot[1]+1],
	  		[pacman_spot[0]-1, pacman_spot[1]-1]] 
	  
	  	pacman_surrounds = lookout.select{|position, holder| positions.include? position}
  	end	
  	pacman_surrounds
  end	

  def get_pacman_spot lookout
  	pacman_spot = []
  	lookout.each_pair do |position, holder| 
  	  pacman_spot = position if holder == :pacman
  	end
  	pacman_spot
  end

end
