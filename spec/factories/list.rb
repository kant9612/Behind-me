FactoryBot.define do
  factory :list do
    list_title { Faker::Lorem.characters(number:5) }
    description { Faker::Lorem.characters(number:20) }
  end
end