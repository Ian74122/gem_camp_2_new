class Post < ApplicationRecord
  validate :title, presence: true
  validate :content, presence: true

  belongs_to :user
end
