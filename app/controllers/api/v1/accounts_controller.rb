class Api::V1::AccountsController < Api::V1::BaseController
  def auth
    @account = current_account
    render json: { account: @account }, status: 200
  end
end