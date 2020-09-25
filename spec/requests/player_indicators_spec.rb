require 'rails_helper'

RSpec.describe 'Player Indicator Managament', type: :request do
  let(:team) { create(:team, :with_players, :with_match, match_count: 5) }
  let(:indicator) { create(:indicator) }

  describe 'POST #create' do
    it 'create player indicator' do
      player = team.players.first
      
      params = { 
        player_id: player.id,
        match_id: team.matches.first.id,
        indicator_id: indicator.id
      }
      
      expect {
        post mark_indicator_path, params: params
      }.to change(player.indicators, :count).by(1)
    end
  end

  describe 'GET #check' do
    it 'check complete indicator for player in last matches' do
      player = team.players.first
      match = team.matches.last
      create(:player_indicator, match: match, indicator: indicator, player: player)

      params = {
        player_id: player.id,
        indicator_id: indicator.id
      }
  
      get check_indicator_path, params: params
      expect(JSON.parse(response.body)["indicator_existed"]).to be true
    end
  end
end