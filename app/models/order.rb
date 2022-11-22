class Order < ApplicationRecord
  include AASM
  belongs_to :user

  aasm column: :state do
    state :pending, initial: true
    state :submitted, :paid, :failed, :revoked

    event :submit do
      transitions from: :pending, to: :submitted
    end

    event :pay do
      transitions from: :submitted, to: :paid
    end

    event :fail do
      transitions from: [:pending, :submitted], to: :failed
    end

    event :revoke do
      transitions from: [:pending, :submitted], to: :revoked
    end
  end
end
