class Department < ApplicationRecord
  has_many :job_histories
  has_many :employees
  belongs_to :location
end
