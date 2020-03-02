FactoryBot.define do
  factory :olympian_event, class: OlympianEvent do
    olympian
    event
    medal { 'Bronze' }
    created_at { "2012-03-27 14:53:59 UTC" }
    updated_at { "2012-03-27 14:53:59 UTC" }
  end
end
