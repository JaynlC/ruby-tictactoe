class Board
  attr_accessor :board

  def initialize()
    @board = [
      [" A1 ", " A2 ", " A3 "], 
      [" B1 ", " B2 ", " B3 "], 
      [" C1 ", " C2 ", " C3 "]]
      # puts board
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
  attr_accessor :player_symbol, :player_choice, :game_board

  def message(player)
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

  def player_choices
    # check choice is valid
    @choice_complete = false  
    until @choice_complete
      puts "Type the position string (e.g. A1) you want to choose:"
      @player_choice = gets.chomp.strip.upcase
      # Edit code to ensure correct position can only be chosen.
      @updated_board = game_board.each{|row| row.replace(row.map {|cell| cell.strip == @player_choice ? cell = " #{player_symbol} " : cell = cell })}
      @choice_complete = true
    end
    puts "You chose #{player_choice} as shown on the board below: "
    create_board(@updated_board)
    computer_choice()
    winner?()
  end

  def computer_choice
    if (player_symbol == "X")
      @computer_symbol = "O"
    elsif (player_symbol == "O")
      @computer_symbol = "X"
    end
    
    computer_selected = false
    until computer_selected
      i = rand(3)
      j = rand(3)
      random_choice = @updated_board[i][j]
      if (random_choice.strip != player_symbol) && (random_choice.strip != @computer_symbol)
        @updated_board[i][j] = " #{@computer_symbol} "
        computer_selected = true
      end
    end
    puts "In response, the Computer with symbol #{@computer_symbol} has Selected the position #{random_choice}:"
    create_board(@updated_board)
    winner?()
  end

  def winner?
    #Resume here.
    # if array combination indices matched, then announce winner and stop game. Else nothing. 
  end

end

player = Player.new
test = MainGame.new.message(player)


# To do:
# present grid //
  # prompt player to choose first spot (and if wanna go first). 
  # if player picks a spot that is not a1 - c3, try again. (until method)
  # populate and update the grid based on indices
  # let CPU pick a spot based on player choice. Ensure cannot pick taken spot. 
  # player pick next spot (back to until method)
  # run a method that runs as soon player picks a spot. It checks at end of loop if winner. If not, ignore the method. 
  
  # Method to reset the game. 
  # Can run a count on number of times PC or player won the game. 