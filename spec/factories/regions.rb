FactoryBot.define do
  factory :region do
    name { "region-#{FFaker::Lorem.word}" }
  end
end
