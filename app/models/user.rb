class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :products
  has_many :categories, through: :products
  has_many :event_users, dependent: :destroy
  has_many :events, through: :event_users
end
