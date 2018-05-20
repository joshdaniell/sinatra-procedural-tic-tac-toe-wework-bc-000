require 'pry'

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  def board=(board)
    @board = board
  end
  
  def board
    @board
  end
  
  require "pry"

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  
  def won?
    
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else   
        false
      end 
    end 
    
    return false
  end 
  
  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end 
  
  def draw?
    full? && !won?
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner
    if won?
      winning_combo = won?
      return @board[winning_combo[0]]
    # else 
    #   return nil 
    end 
  end 
  
  def turn_count
    @board.count { |x| x == "X" || x == "O"}
  end 
  
  def current_player
    num = turn_count
    num % 2 == 0 ? "X" : "O"
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, player_token)
    @board[index.to_i] = player_token
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turns(hash)
    hash.each do |pair|
      move(pair[0], pair[1])
    end
  end
  
  def play
    
    until over?
      turn
    end
    
    if won?
      win = winner
      puts "Congratulations #{win}!"
    elsif draw?
      puts "Cat's Game!"
    end 
    
  end
  
  
end