json.game do
  json.id @game.id
  json.server_id @game.server_id
  json.receiver @game.receiver
  json.deuce @game.deuce
  json.player1 do
    json.id @player1.id
    json.name @player1.name
  end
  json.player2 do
    json.id @player2.id
    json.name @player2.name
  end
  json.points @points
end