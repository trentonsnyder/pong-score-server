json.players @players.each do |player|
  json.id player.id
  json.name player.name
end