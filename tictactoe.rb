class Board
  attr_reader :board

  def initialize()
    @board = [
      [" A1 ", " A2 ", " A3 "], 
      [" B1 ", " B2 ", " B3 "], 
      [" C1 ", " C2 ", " C3 "]]
  end

  def create_board
    puts "\n----------------"
    self.board.each do |row|
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
  # present grid //
  # prompt player to choose first spot (and if wanna go first). 
  # if player picks a spot that is not a1 - c3, try again. (until method)
  # populate and update the grid based on indices
  # let CPU pick a spot based on player choice. Ensure cannot pick taken spot. 
  # player pick next spot (back to until method)
  # run a method that runs as soon player picks a spot. It checks at end of loop if winner. If not, ignore the method. 
  
  # Method to reset the game. 
  # Can run a count on number of times PC or player won the game. 
  
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
    present_board()
  end
  
  def present_board
    @game_board = Board.new.create_board
    player_choices()
  end

  def player_choices
    # check choice is valid
    @choice_complete = false  
    catch (:check_choice) do
      until @choice_complete
        puts "Type the position string (e.g. A1) you want to choose:"
        @player_choice = gets.chomp.upcase
        game_board.each do |row|
          row.each do |cell|
            if @player_choice == cell.strip
              puts "You have selected #{@player_choice}"
              cell = " #{@player_choice} " # not working, debug
              @choice_complete = true
              throw :check_choice
            end
          end
        end
      end
    end
    puts game_board
    game_board.create_board  # This is not working, debug
    compute_choice()
  end

  def compute_choice
    puts "resume from here"
  end
end

player = Player.new
test = MainGame.new.message(player)