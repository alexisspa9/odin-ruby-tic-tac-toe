require "./board.rb"

class Game
	def initialize()
		@gameplay_board = Board.new
		@player_one_turn = true
	end

	def start
		puts "Welcome to tic-tac-toe!!\nType 1 to start as 'X' or 2 to start as 'O' or 'H' for help"
		selection = gets.chomp
		if (selection == 'H')
			show_help
			start
		end
		@player_one_turn = false if selection.to_i == 2
		@gameplay_board.draw
	end

	def change_position(pos)
		@player_one_turn ? @gameplay_board.make_move(pos,1) : @gameplay_board.make_move(pos,2)
		@player_one_turn = !@player_one_turn
	end

	def is_game_won?
		@gameplay_board.board_won?	
	end

	def is_board_full?
		@gameplay_board.board_full?
		
	end

	def reset_game
		@gameplay_board.reset_game
	end


	private
	def show_help
		puts "Below you see the game board with numbers representing the positions of the board:\n-----------
| 1 | 2 | 3 |
|-----------|
| 4 | 5 | 6 |
|-----------|
| 7 | 8 | 9 |
 ----------- \nThe player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row wins the game."
	end

end
