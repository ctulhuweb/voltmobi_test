class PlayersController < ApplicationController
  def index
    @players = PlayerQuery.call(permit_params)
    render json: @players
  end

  private

  def permit_params
    params.permit(:team_id, :indictor_id)
  end
end