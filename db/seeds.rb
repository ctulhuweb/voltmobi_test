TEAMS_COUNT = 2
INDICATORS_COUNT = 2
PLAYER_INDICATORS = 30

teams = FactoryBot.create_list(:team, TEAMS_COUNT, :with_players, :with_match)
indicators = FactoryBot.create_list(:indicator, INDICATORS_COUNT)

players = Player.all

PLAYER_INDICATORS.times do
  pl = players[rand(players.size - 1)]
  player_matches = pl.matches
  match = player_matches[rand(player_matches.size - 1)] 
  FactoryBot.create(:player_indicator, player: pl, match: match, indicator: indicators.shuffle.first) 
end

