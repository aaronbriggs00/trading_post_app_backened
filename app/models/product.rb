class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :description, length: { maximum: 500 }
end
