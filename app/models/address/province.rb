class Address::Province < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :region
  has_many :posts, class_name: 'Post', foreign_key: 'address_province_id'
end
