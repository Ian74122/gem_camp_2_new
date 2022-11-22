class Order < ApplicationRecord
  include AASM
  belongs_to :user
end
