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
    transient do
      match_count { 1 }
    end

    after(:create) do |team, evaluator|
      FactoryBot.create_list(:match, evaluator.match_count, team: team)
    end
  end
end