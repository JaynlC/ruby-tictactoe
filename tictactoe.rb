class Board
  attr_accessor :board

  def initialize()
    @board = [
      [" A1 ", " A2 ", " A3 "], 
      [" B1 ", " B2 ", " B3 "], 
      [" C1 ", " C2 ", " C3 "]]
  end

  def create_board(board)
    puts "\n----------------"
    board.each do |row|
      print "|"
      row.each do |cell|
        print "#{cell}|"
      end
      puts "\n----------------"
    end
  end 
end

class Player
  attr_accessor :name
  
  def initialize()
    puts "What is your name?"
    @name = gets.chomp
  end
end

class MainGame < Board
  
  attr_accessor :player_symbol, :player_choice, :game_board, :random_choice, :updated_board, :winner, :player_name

  @@count_turns = 0

  def message(player)
    @player_name = player.name
    puts "Welcome #{player.name} to TicTacToe!"
    @symbol_choice = false
    until @symbol_choice
      puts "Please choose either X or O as your icon"
      @player_symbol = gets.chomp.upcase
      if player_symbol == "X" || player_symbol =="O" 
        print "Your icon choice is #{player_symbol}"
        @symbol_choice = true
      end
    end
    @game_board = Board.new.create_board(board)
    player_choices()
  end

  def player_choices()
    @player_choice_valid = false
    until @player_choice_valid
      puts "Type the position string (e.g. A1) you want to choose:"
      @player_choice = gets.chomp.strip.upcase
      for i in (0..2)
        for j in (0..2)
          if player_choice == game_board[i][j].strip && player_choice != "X" && player_choice != "O"
            puts "You chose #{player_choice} as shown on the board below: "
            @player_choice_valid = true
          end
        end
      end
    end
    @updated_board = game_board.each{|row| row.replace(row.map {|cell| cell.strip == player_choice ? cell = " #{player_symbol} " : cell = cell })}
    create_board(updated_board)
    @@count_turns += 1
    @@count_turns == 9 ? draw_message() : computer_choice()
  end

  def computer_choice()
    if (player_symbol == "X")
      @computer_symbol = "O"
    elsif (player_symbol == "O")
      @computer_symbol = "X"
    end
    
    computer_selected = false
    until computer_selected
      i = rand(3)
      j = rand(3)
      @random_choice = updated_board[i][j]
      if (random_choice.strip != player_symbol) && (random_choice.strip != @computer_symbol)
        updated_board[i][j] = " #{@computer_symbol} "
        computer_selected = true
      end
    end
    @@count_turns += 1
    puts "In response, the Computer with symbol #{@computer_symbol} has Selected the position #{random_choice}:"
    create_board(updated_board)
    win_check()
  end

  def win_check()
    @winner_declared = false
    # check rows and columns for win
    for i in (0..2)
      if (updated_board[i][0] == updated_board[i][1]) && (updated_board[i][1] == updated_board[i][2])
        @winner = updated_board[i][0].strip
        @winner_declared = true
        break 
      elsif (updated_board[0][i] == updated_board[1][i]) && (updated_board[1][i] == updated_board[2][i])
        @winner = updated_board[0][i].strip
        @winner_declared = true
        break
      end
    end
    # check diagonally for win
    if (updated_board[0][0] == updated_board[1][1]) && (updated_board[1][1] == updated_board[2][2])
      @winner = updated_board[0][0].strip
      @winner_declared = true
    elsif (updated_board[2][0] == updated_board[1][1]) && (updated_board[1][1] == updated_board[0][2])
      @winner = updated_board[2][0].strip
      @winner_declared = true
    end
    @winner_declared ? win_message() : player_choices()
  end

  def win_message()
    if winner == player_symbol
      puts "Congratulations #{player_name}, You Win!"
      end_game()
    elsif winner == @computer_symbol
      puts "Computer wins this time, better luck next time #{player_name}!"
      end_game()
    end
  end

  def draw_message
    puts "This game is a draw, close one!"
    end_game()
  end

  def end_game
    puts "Restart game or Refresh to play again"
  end
end

player = Player.new
tictactoe = MainGame.new.message(player)