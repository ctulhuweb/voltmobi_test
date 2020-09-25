class Player < ApplicationRecord
  belongs_to :team
  has_many :matches, through: :team
  has_many :indicators, class_name: "PlayerIndicator"
end
