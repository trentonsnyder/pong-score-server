class Api::GamesController < Api::BaseController
  def create
    p1 = current_account.players.find(params[:player1])
    p2 = current_account.players.find(params[:player2])
    @game = Game.create(server_id: p1.id)
    @participant1 = Participant.create(game_id: @game.id, player_id: p1.id)
    @participant2 = Participant.create(game_id: @game.id, player_id: p2.id)
    # render jbuilder
  end
end
