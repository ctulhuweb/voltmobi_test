FactoryBot.define do
  factory :team do
    name { Faker::Sports::Football.team }
  end

  trait :with_players do
    transient do 
      players_count { 5 }
    end

    after(:create) do |team, evaluator|
      FactoryBot.create_list(:player, evaluator.players_count, team: team)
    end
  end

  trait :with_match do
    after(:create) do |team|
      FactoryBot.create(:match, team: team)
    end
  end
end