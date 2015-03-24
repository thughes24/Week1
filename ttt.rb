=begin
create multidimensional array
define winning combinations
player turn
computer turn
result
=end
require 'pry'
def initialize_board
  b={}
  (1..9).each {|x| b[x] = " "}
  b
end

board = initialize_board

def draw_board(b)
  system 'clear'
  puts " #{b[1]}  |  #{b[2]}  |  #{b[3]}"
  puts "------------------"
  puts " #{b[4]}  |  #{b[5]}  |  #{b[6]}"
  puts "------------------"
  puts " #{b[7]}  |  #{b[8]}  |  #{b[9]}"
end

def empty_positions(b)
  r = b.select {|k,v| v == " "}
  return r
end

def player_picks(b)
  begin
  puts "Pick a position (1-9)"
  position = gets.chomp.to_i
  empty_positions(b)
  if empty_positions(b).include?(position)
    b[position] = "X"
    chosen = "no"
  else 
    puts "Please pick a vacant square"
    chosen = "yes"
  end
end until !empty_positions(b).include?(position) && b[position] == "X" && chosen == "no"
end

def computer_picks(b)
  selection = empty_positions(b).keys.sample
  b[selection] = "O"
end

def winner?(b)
  winning_sequence = [[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7],[1,4,7],[2,5,8],[3,6,9]]
  winning_sequence.each do |line| 
      if b[line[0]] == "X" && b[line[1]] == "X" && b[line[2]] == "X"
      return "user"
    elsif b[line[0]] == "O" && b[line[1]] == "O" && b[line[2]] == "O"
      return "computer"
    else
      return nil
    end
  end
end



begin
draw_board(board)
player_picks(board)
computer_picks(board)
winner = winner?(board)
draw_board(board)
end until empty_positions(board).empty? || winner != nil
puts "winner is #{winner}" if winner != nil
puts "It's a tie!" if winner == nil
