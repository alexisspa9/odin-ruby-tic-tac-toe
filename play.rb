require "./game.rb"

class Play
	def initialize()
		@game_won = false
		@draw = false
		@turn = false
		@gameplay = Game.new
		@gameplay.start
		play_game()
	end
	def play_game
		while !@game_won
			game_round()
			if @gameplay.is_game_won?
				@game_won = true
			end
			if @gameplay.is_board_full?
				@game_won = true
				@draw = true
			end
		end
		if @draw
			puts "Nobody wins!!\ntype 'R' to restart or 'Q' to quit"
			player_input = gets.chomp
			restart_or_quit(player_input)
		else
			player = @turn == true ? 1 : 2
			puts "Player #{player} won the game!!\ntype 'R' to restart or 'Q' to quit"
			player_input = gets.chomp
			restart_or_quit(player_input)
		end

	end


	private

	def game_round()
		player = @turn == false ? 1 : 2
		puts "Player #{player} pick a position type 1 to 9"
		position = gets.chomp
		@gameplay.change_position(position.to_i - 1)
		@turn = !@turn
	end

	def restart_or_quit(c)
		if (c == "R")
			@game_won = false
			@gameplay.reset_game
			@gameplay.start
			play_game
		else
			return -1
		end
	end


end

mygame = Play.new

