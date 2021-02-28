class TicTacToe

    WIN_COMBINATIONS = [
        [0, 1, 2], #top row
        [3, 4, 5], #middle row
        [6, 7, 8], #bot row
        [0, 4, 8], #diag
        [6, 4, 2], #diag
        [0, 3, 6], #left
        [1, 4, 7], #mid
        [2, 5, 8]  #right
    ]
    def initialize
        @board = Array.new(9, " ") # empty board array
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input) # takes input -1 to work with the array.
        input.to_i - 1
    end

    def move(index, token) #reasigns the index with a token. (x, o)
        @board[index] = token
    end

    def position_taken?(index) #checks if index is not an empty string.
        @board[index] != " "
    end

    def valid_move?(index) #checks if position is taken and within bounds of board
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count #counts spots that are not empty spots.
        @board.count {|i| i != " "}
    end

    def  current_player #determines who turn it is
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Please enter a number (1-9):"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index) 
          token = current_player
          move(index, token)
        else
          turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
          if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
            return combo
          end
        end
    end
    
    def full?
        @board.all?{|square| square != " " }
    end
    
    def draw?
        full? && !won?
    end
    
    def over?
        won? || draw?
    end
    
    def winner
        if combo = won?
          @board[combo[0]]
        end
    end
    
    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end