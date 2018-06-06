WIN_COMBINATIONS = [
  [0,1,2], #top rows
  [3,4,5], #middle rows
  [6,7,8], #bottom rows
  [0,3,6], #left columns
  [1,4,7], #middle columns
  [2,5,8], #right columns
  [2,4,6], #starting from the right
  [0,4,8] #starting from the left
  ]
board = ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board,index, character)
  board[index] = character
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false
    true
  else
    false
end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
       false
    elsif board[index] == "X" || board[index] == "O"
       true
    end
end

def turn(board)
  character = current_player(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, character)
  else
    until valid_move?(board, index)
      puts "Please enter 1-9:"
      input = gets
      index = input_to_index(input)
    end
    move(board, index, character)
  end
  display_board(board)
end

def play(board)
  turn = 0
  until turn == 9
    turn += 1
    turn(board)
  end
end

def turn_count(board)
      counter = 0

  board.each do |board|

    if board != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)

  if turn_count(board) % 2 == 0
    return "X"
else
  return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]


if position_1 == "X" && position_2 == "X" && position_3 == "X"
return win_combination
break
end
if position_1 == "O" && position_2 == "O" && position_3 == "O"
return win_combination
break
end
  end
  return false
end

def full?(board)
board.each do |token|
  if token == " " || token == ""
    return false
    break
  end
end
  return true
end

def draw?(board)
  if won?(board)
    return false
  else full?(board)
    return true
  end
end

def over?(board)
  if full?(board)
    return true
  elsif won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    winning_token = won?(board)
    winner = board[winning_token[0]]
    return winner
  end
end
