class Job < ApplicationRecord
  has_many :job_histories
  has_many :employees
end
