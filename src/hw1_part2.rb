### Part II - rock, paper, scissors

require 'set'

class WrongNumberOfPlayersError < StandardError ; end

class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  strategies = Set.new ["r","R","p","P","s","S"]

  raise WrongNumberOfPlayersError unless game.length ==2
  raise NoSuchStrategyError unless strategies.include?(game[0][1]) && strategies.include?(game[1][1])
  case game[0][1]
  when "r" , "R"
    case game[1][1]
    when "s" , "S"
      return game[0]
    when "p" , "P"
      return game[1]
    end
  when "s" , "S"
    case game[1][1]
    when "r" , "R"
      return game[1]
    when "p" , "P"
      return game[0]
    end

  when "p" , "P"
    case game[1][1]
    when "r" , "R"
      return game[0]
    when "s" , "S"
      return game[1]
    end
  end
  return game[0]
end

def rps_tournament_winner(tournament) 
  
  begin
    #puts "tournament: #{tournament}" 
    return rps_game_winner(tournament)
  rescue # Not a game, a tournament instead    
    tournament.each do |t|
      tournament[tournament.index t]=rps_tournament_winner(t) 
    end
    rps_tournament_winner(tournament)
  end
end

def rps_tournament_winner_recursive(tournament)
  if (tournament[1].length()==0)
    #puts (tournament[0])
    #puts (tournament[1])
    puts rps_game_winner([tournament[0],tournament[1]])
    return rps_game_winner([tournament[0],tournament[1]])
  else
    return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end
end
