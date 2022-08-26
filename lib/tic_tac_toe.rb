require 'pry'

class  TicTacToe 

    attr_accessor :board, :winning_player, :winning_combo  

    def initialize
        @board = Array.new(9, " ")
        @winning_player = ""
        @winning_combo = []
    end

    WIN_COMBINATIONS =[
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
        ]

        def display_board
            puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} \n-----------\n #{self.board[3]} | #{self.board[4]} | #{self.board[5]} \n-----------\n #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
        end

        def input_to_index(string)
            @choose = string.to_i-1
        end

        def move(index, player= "X")
            @board [index] = player
        end

        def position_taken?(index)
             @board[index] != " "
        end

        def valid_move?(index)
            !position_taken?(index) && @board[index]
        end

        def turn_count 
            count = 0
            @board.each do |i|
                count += 1 if i != " "
            end
            count 
        end

        def current_player 
            current_player = "X"
            current_count = turn_count
            if current_count.odd?
                current_player = "O"
            end
            return current_player
        end

        
        def turn 
            puts "Please enter 1-9:"
            user_input = gets.strip
            index = input_to_index(user_input)
            if valid_move?(index)
                move(index, current_player)
                display_board 
            else
                turn 
            end
        end

        def won?
            WIN_COMBINATIONS.detect do |combo|
                @board[combo[0]] == @board[combo[1]] &&
                @board[combo[1]] == @board[combo[2]] &&
                position_taken?(combo[0])
            end
        end

        def full?
            self.board.each do |i|
                if i == " "
                    return false
                end
            end
            return true
        end

        def draw?
            !won? && full?
        end

        def over?
            won? || draw?
        end

        def winner
            if winning_combo = won?
                @board[winning_combo.first]
            end
        end

        def play 
            while !over?
                turn 
            end
            if won?
                puts "Congratulations #{winner}!"
            elsif draw?
                puts "Cat's Game!"
            end

        end
end