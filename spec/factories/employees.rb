FactoryBot.define do
  factory :employee do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    hire_date { DateTime.now }
    email { FFaker::Internet.email }
    phone_number { "380#{rand(23444)}" }
    manager_id { 'test' }
    salary { rand(1000..11100) }
    job
    department
  end
end
