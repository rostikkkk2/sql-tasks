FactoryBot.define do
  factory :location do
    street_address { FFaker::AddressUS.street_address }
    postal_code { FFaker::AddressUS.zip_code }
    city { FFaker::AddressUS.city }
    state_province { 'province' }
    country
  end
end
