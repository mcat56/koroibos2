FactoryBot.define do
  factory :team, class: Team do
    country { Faker::Address.country}

    created_at { "2012-03-27 14:53:59 UTC" }
    updated_at { "2012-03-27 14:53:59 UTC" }
  end
end
