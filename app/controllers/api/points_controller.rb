class Api::PointsController < Api::BaseController
  before_action :set_game

  def create
    @player = current_account.players.find(params[:player_id])
    @point = @game.points.new(player_id: @player.id, deuce: params[:deuce])
    if @point.save
    else
      render json: { error: 'error' }, status: 401
    end
    # render jbuilder
  end

  def undo
    point_id = @game.points.last.id
    if @point.destroy
      render json: { point: { id: point_id } }, status: 200
    else
      render json: { 'error': error }, status: 401
    end
  end

  private

  def set_game
    @game = current_account.games.find(params[:game_id])
  end
end