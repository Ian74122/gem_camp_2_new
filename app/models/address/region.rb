class Address::Region < ApplicationRecord
  validates :name, presence: true
  validates :code, unique: true
end
