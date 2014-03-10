class Map
	def map

		map =  [[:wall,:wall,:wall,:wall,:wall,:wall,:wall,:wall,:wall],
				[:wall,:pellet,:pellet,:pellet,:pellet,:pellet,:pellet,:pellet,:wall],
				[:wall,:pellet,:pellet,:pellet,:wall,:pellet,:pellet,:pellet,:wall],
				[:wall,:pellet,:wall,:pellet,:pellet,:pellet,:wall,:pellet,:wall],
				[:wall,:pellet,:pellet,:pellet,:wall,:pellet,:pellet,:pellet,:wall],
				[:wall,:pellet,:wall,:pellet,:pellet,:pellet,:wall,:pellet,:wall],
				[:wall,:pellet,:pellet,:pellet,:wall,:pellet,:pellet,:pellet,:wall],
				[:wall,:pellet,:wall,:pellet,:pellet,:pellet,:wall,:pacman,:wall],
				[:wall,:wall,:wall,:wall,:wall,:wall,:wall,:wall,:wall]]

		pacmans_world = {}


		map.each_with_index do |row, row_index|
			row.each_with_index do |column, column_index|
				pacmans_world[[row_index, column_index]] = column
			end
		end		

		puts pacmans_world

	end
end
