require 'set'
#require 'TypeError'

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
end

def rps_tournament_winner(tournament)  
  if (tournament[1].length()==0)
    #puts (tournament[0])
    #puts (tournament[1])
    puts rps_game_winner([tournament[0],tournament[1]])
    return rps_game_winner([tournament[0],tournament[1]])
  else  
    return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end  
end

def test_rps_game_winner
  game = [["Armando","P"],["Dave","X"]]
  game = [["Armando","X"],["Dave","r"]]
  game = [["w","P"],["l","r"]]
  game = [["w","r"],["l","s"]]
  game = [["l","s"],["w","R"]]
  game = [["w","s"],["l","p"]]
  game = [["l","p"],["w","s"]]
  game = [["w","p"],["l","R"]]
  game = [["l","r"],["w","P"]]
  return rps_game_winner(game)
end

def test_rps_tournament_winner
  games =
  [
    [
      [ ["Armando", "P"], ["Dave", "S"] ],
      [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
      [ ["Allen", "S"], ["Omer", "P"] ],
      [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
  ]
  return rps_tournament_winner(games)
end
#movida = test_rps_game_winner
#puts movida[1]

puts test_rps_tournament_winner
