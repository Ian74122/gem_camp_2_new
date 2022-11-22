class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :posts
  has_many :comments

  enum genre: { client: 0, admin: 1 }
  has_many :orders

  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
