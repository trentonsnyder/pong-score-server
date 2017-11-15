class Api::PlayersController < Api::BaseController
  def index
    @players = current_account.players
    # render jbuilder
  end

  def create
    @player = current_account.players.new(player_params)
    if @player.save
    else
      render json: { error: 'error' }, status: 401
    end
    # render jbuilder
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end