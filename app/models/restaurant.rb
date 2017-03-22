class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: ["Chinese", "Italian", "Japanese", "French", "Belgian"],
    message: "%{value} is not a valid category from Chinese, Italian, japanese, french, belgian" }
end
