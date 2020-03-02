FactoryBot.define do
  factory :sport, class: Sport do
    name { Faker::Team.sport}

    created_at { "2012-03-27 14:53:59 UTC" }
    updated_at { "2012-03-27 14:53:59 UTC" }
  end
end
