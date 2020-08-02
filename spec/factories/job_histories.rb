FactoryBot.define do
  factory :job_history do
    start_date { DateTime.now }
    end_date { Time.now + 234423423 }
    employee
    job
    department
  end
end
