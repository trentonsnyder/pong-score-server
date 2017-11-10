class Api::AccountsController < Api::BaseController
  def auth
    @account = current_account
    render json: { account: @account }, status: 200
  end
end