class Address::Province < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :region
end
