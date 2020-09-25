class PlayerIndicatorsController < ApplicationController

  def create
    player_indicator = PlayerIndicator.create(
      player_id: params[:player_id],
      match_id: params[:match_id], 
      indicator_id: params[:indicator_id]
    )
    render json: player_indicator
  end

  def check
    player = Player.find(permit_params[:player_id])
  
    indicator_existed = player.indicators
      .where(player_indicators: { 
        match_id: player.matches.order(:created_at).limit(5),
        indicator_id: params[:indicator_id] 
      }).exists?
    render json: { indicator_existed: indicator_existed }
  end

  private

  def permit_params
    params.permit(:player_id, :match_id, :indicator_id)
  end
end