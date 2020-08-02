class Country < ApplicationRecord
  has_many :locations
  belongs_to :region
end
