require_relative "player"
require_relative "question"
require_relative "turn"
class Game 
  attr_accessor :player1, :player2, :turn
  def initialize (n1, n2)
    @player1 = Player.new(n1)
    @player2 = Player.new(n2)
    @turn = Turn.new
  end
end
puts "Palyer 1:"
player1 = gets.chomp
puts "Player 2:"
player2 = gets.chomp

newGame = Game.new(player1, player2)
while (newGame.player2.life > 0 && newGame.player1.life > 0)
  if (newGame.turn.counter % 2 == 0) 
    player = newGame.player1
  else 
    player = newGame.player2
  end
  randomQuestion = Question.new
  puts "#{player.name}: #{randomQuestion.question}"
  user_ans = gets.chomp
  if user_ans.to_i == randomQuestion.result
    puts "#{player.name}: YES! You are correct."
    puts "#{player1} #{newGame.player1.life}/3 vs  #{player2}: #{newGame.player2.life}/3"
    puts "-----NEW TURN-----"
  else 
    player.life -= 1
    puts "#{player.name}: Seriously? No!"
    puts "#{player1} #{newGame.player1.life}/3 vs  #{player2}: #{newGame.player2.life}/3"
    puts "-----NEW TURN-----"
  end
  if player.life == 0
    if newGame.player1.life == 0
      puts "#{player2} wins with a score of #{newGame.player2.life}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    else
      puts "#{player1} wins with a score of #{newGame.player1.life}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    end
  end
  newGame.turn.counter += 1
end
