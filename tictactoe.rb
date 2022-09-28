class Board
  attr_reader :board

  def initialize()
    @board = [
      [" - ", " - ", " - "], 
      [" - ", " - ", " - "], 
      [" - ", " - ", " - "]]
  end

  def create_board
    board.each do |row|
      print "|"
      row.each do |cell|
        print "#{cell}|"
      end
      puts "\n-------------"
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

class IntroToGame
  attr_accessor :player_symbol

  def message(player)
    puts "Welcome #{player.name} to TicTacToe!"
    print "Enter the symbol you want to pick:"
    @player_symbol = gets.chomp.upcase
    
    until player_symbol == "X" || player_symbol =="O" 
      puts "Please choose either X or O"
      player_symbol = gets.chomp.upcase
      #infinite loop, requries fix
    end

    if player_symbol == "X" || player_symbol =="O" 
      puts "You have selected #{player_symbol}"
    end
  end
end

player = Player.new
test = IntroToGame.new.message(player)

test = Board.new.create_board