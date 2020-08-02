class Employee < ApplicationRecord
  belongs_to :department
  has_many :job_histories
  belongs_to :job
end
