require 'rails_helper'

RSpec.describe 'Players Management', type: :request do
  before do
    @team = create(:team, :with_players, :with_match)
    @indicator = create(:indicator)
  end

  describe 'GET #index' do
    it 'return status success' do
      params = {
        team_id: @team.id,
        indicator_id: @indicator.id
      }
      get root_path, params: params
      expect(response).to have_http_status(:success)
    end
  end
end