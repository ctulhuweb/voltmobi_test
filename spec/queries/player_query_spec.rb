require 'rails_helper'

describe PlayerQuery do
  before do
    players_count = 5
    @first_team = create(:team, :with_players, :with_match, players_count: players_count)
    @second_team = create(:team, :with_players, :with_match, players_count: players_count)
    @indicator = create(:indicator)
    match = @first_team.matches.first

    @first_team.players.each_with_index do |pl, i|
      create_list(:player_indicator, players_count - i, player: pl, match: match, indicator: @indicator)
    end

    @second_team.players.each_with_index do |pl, i|
      create_list(:player_indicator, players_count - i + 10, player: pl, match: match, indicator: @indicator)
    end
  end


  it 'return top players in all teams' do
    params = {
      indicator_id: @indicator.id
    }
    players = described_class.call(params)
    expect(players).to eq(@second_team.players.limit(5))
  end

  it 'return top players in team' do
    params = {
      team_id: @first_team.id,
      indicator_id: @indicator.id
    }
    players = described_class.call(params)
    expect(players).to eq(@first_team.players.limit(5))
  end
end