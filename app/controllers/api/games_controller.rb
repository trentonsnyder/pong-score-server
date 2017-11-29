class Api::GamesController < Api::BaseController

  def index
    @games = current_account.games.order('id DESC')
    # render jbuilder
  end

  def create
    p1 = current_account.players.find(params[:player1])
    p2 = current_account.players.find(params[:player2])
    @game = current_account.games.new(server_id: p1.id, receiver_id: p2.id)
    if @game.save && p1 && p2
      Participant.create(game_id: @game.id, player_id: p1.id)
      Participant.create(game_id: @game.id, player_id: p2.id)
    else
      render json: { error: 'error' }, status: 401
    end
    # render jbuilder
  end

  def finish
    @game = current_account.games.find(params[:id])
    if @game.assignScores
    else
      render json: { error: 'invalid scores' }, status: 401
    end
  end

  def show
    @game = current_account.games.find(params[:id])
    if @game
      @player1 = @game.server
      @player2 = @game.receiver
      @points = @game.points
    else
      render json: { error: 'error' }, status: 401
    end
    # render jbuilder
  end
  
end
