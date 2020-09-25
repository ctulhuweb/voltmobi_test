FactoryBot.define do
  factory :indicator do
    name { Faker::Job.key_skill }
  end
end