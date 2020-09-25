class PlayerQuery
  def self.call(params)
    relation = Player.select("players.id, count(players.id) as indicators_count")
      .joins(:team, :indicators)
      .where(player_indicators: { indicator_id: params[:indicator_id] })
      .group("players.id")
      .order("indicators_count desc")
      .limit(5)
    relation = relation.where(team_id: params[:team_id]) if params[:team_id].present?
    relation
  end
end