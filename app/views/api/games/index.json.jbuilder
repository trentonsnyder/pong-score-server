json.games @games.includes(:players).each do |game|
  json.id game.id
  json.server_id game.server_id
  json.receiver game.receiver
  json.deuce game.deuce
  json.player1 do
    json.id game.server.id
    json.name game.server.name
  end
  json.player2 do
    json.id game.receiver.id
    json.name game.receiver.name
  end
end