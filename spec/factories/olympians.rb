FactoryBot.define do
  factory :olympian, class: Olympian do
    name { Faker::Name.first_name}
    age { Faker::Number.number(digits: 2)}
    sex { Faker::Gender.short_binary_type }
    weight { Faker::Number.number(digits: 2)}
    height { Faker::Number.number(digits: 3)}
    sport
    team
    created_at { "2012-03-27 14:53:59 UTC" }
    updated_at { "2012-03-27 14:53:59 UTC" }
  end
end
