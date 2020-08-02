FactoryBot.define do
  factory :country do
    name { FFaker::AddressUS.country }
    region
  end
end
