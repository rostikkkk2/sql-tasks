FactoryBot.define do
  factory :job do
    title { FFaker::Lorem.word }
    min_salary { rand(1000) }
    max_salary { rand(100000) + 1000 }
  end
end
