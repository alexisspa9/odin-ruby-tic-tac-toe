class Board
	
	# initializes the Board instance with an empty board
	def initialize()
		@gameplay_positions = [0,0,0,
								0,0,0,
								0,0,0]

	end

	def reset_game
		@gameplay_positions = [0,0,0,
								0,0,0,
								0,0,0]
	end
	# checks if the board is won
	def board_won?
		won = false
		
		WINNING_POSITIONS.each do |positions|
			n = 0
			for i in 0..8
			   n += 1 if (positions[i] == @gameplay_positions[i] && positions[i] != 0)
			end
			if n == 3
				won = true
			end
		end

		won ? true : false
	end

	def board_full?
		@gameplay_positions.all? {|n| n > 0 }	
	end


	# takes gamePlay positions as input and returns 
	# the game board with the correspending player positions.
	def draw()
		# convert integer array to X and O
		player_moves = @gameplay_positions.map do |n|
			case n
			when 1
			  "X"
			when 2
			  "O"
			else
			  " "
			end
		end

		printMap(player_moves)
		
	end

	# get position of the board and value for player
	# returns the updated board
	def make_move(pos, value)
		if  @gameplay_positions[pos] == 0
			@gameplay_positions[pos] = value
			draw()
		else
			draw()
			not_available()
		end
	end

	private
	
	# takes an array of positions
	# prints the map
	def printMap(positions)
		puts   " -----------
| #{positions[0]} | #{positions[1]} | #{positions[2]} |
|-----------|
| #{positions[3]} | #{positions[4]} | #{positions[5]} |
|-----------|
| #{positions[6]} | #{positions[7]} | #{positions[8]} |
 ----------- "
	end

	# prints not available position
	def not_available
		puts "This position is not available! please choose another"	
	end

	WINNING_POSITIONS = [
[1,1,1,
0,0,0,
0,0,0],
[0,0,0,
1,1,1,
0,0,0],
[0,0,0,
0,0,0,
1,1,1],
[1,0,0,
1,0,0,
1,0,0],
[0,1,0,
0,1,0,
0,1,0],
[0,0,1,
0,0,1,
0,0,1],
[1,0,0,
0,1,0,
0,0,1],
[0,0,1,
0,1,0,
1,0,0],
[2,2,2,
0,0,0,
0,0,0],
[0,0,0,
2,2,2,
0,0,0],
[0,0,0,
0,0,0,
2,2,2],
[2,0,0,
2,0,0,
2,0,0],
[0,2,0,
0,2,0,
0,2,0],
[0,0,2,
0,0,2,
0,0,2],
[2,0,0,
0,2,0,
0,0,2],
[0,0,2,
0,2,0,
2,0,0],

	]
end