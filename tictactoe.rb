
def default_board
	%w[1 2 3 4 5 6 7 8 9] # this is the backbone/data structure of our tictactoe game, i.e an ARRAY.
		 				  # A efficient way of converting all elements inside a array to string is through the use of %w[] (use [] as recommended by style guide) 
		 				  # where the elements of the array are passed in as an argument(s) delimited by spaces.  
end



def display_board(array)
	puts "#{array[0]} | #{array[1]} | #{array[2]}"
	puts "----------"
	puts "#{array[3]} | #{array[4]} | #{array[5]}"
	puts "----------"
	puts "#{array[6]} | #{array[7]} | #{array[8]}"	
end


	
def get_input()
	puts "Please enter an integer from 1 to 9."
	return gets.chomp
end



def valid_input(board,input)
	loop do
    	if board.include?(input)
    		input # convert "input" to an integer. "input" is in string format. we have to convert it to a integer in order to use it to access the indices of default board(which is an array)
    		break
    	else
    		if board.include?(get_input) 
    			input
    			break
    		end
		end
	end
end


def players
	player1 = "X"
	player2 = "O"
	return [player1, player2].cycle
end


def updateboard(board,player, input)
	board[input.to_i - 1] = player
	board
end


# board = display_board(default_board) 	# prints the board


def main()
	display_board(default_board) 	# prints the board
	input = get_input() 			# *** the trick here is to assign the return value of another method inside this method to a variable so that we can use that return value. 
									# *** if not, we will be unable to use that return value due to differences in method scope.**
	board = default_board
    number = valid_input(board,input) 					# test if input is valid.
    player = players.next
    display_board(updateboard(default_board,player,input))
end

main()

