class Api::PointsController < Api::BaseController
  before_action :set_game

  def create
    @player = current_account.players.find(params[:player_id])
    @point = @game.points.new(player_id: @player.id)
    if @point.save
      @game.check_deuce
      @point.update(deuce: @game.deuce)
    else
      render json: { error: 'error' }, status: 401
    end
    # render jbuilder
  end

  def undo
    @point = @game.points.last
    point_id = @point.id
    if @point.destroy
      @game.check_deuce
      # @game.participants.each { |p| p.update(score: 0) }
      render json: { point: { id: point_id }, game: @game }, status: 200
    else
      render json: { 'error': error }, status: 401
    end
  end

private

def set_game
    @game = current_account.games.find(params[:game_id])
  end
end