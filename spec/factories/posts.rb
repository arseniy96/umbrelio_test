FactoryBot.define do
  factory :post do
    title { Faker::GameOfThrones.house }
    text { Faker::GameOfThrones.character }
    user_ip { Faker::Internet.ip_v4_address }
  end
end