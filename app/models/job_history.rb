class JobHistory < ApplicationRecord
  belongs_to :job
  belongs_to :department
  belongs_to :employee
end
