FactoryBot.define do
  factory :event, class: Event do
    name { Faker::Esport.event}
    sport
    game
    created_at { "2012-03-27 14:53:59 UTC" }
    updated_at { "2012-03-27 14:53:59 UTC" }
  end
end
