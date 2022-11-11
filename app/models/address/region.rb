class Address::Region < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true
end
