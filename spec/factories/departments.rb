FactoryBot.define do
  factory :department do
    name { "department-#{FFaker::Lorem.word}" }
    manager_id { 'test' }
    location
  end
end
