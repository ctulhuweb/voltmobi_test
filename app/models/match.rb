class Match < ApplicationRecord
  belongs_to :team
  has_many :player_indicators
end
