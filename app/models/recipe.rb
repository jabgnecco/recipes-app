class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  validates :category, presence: true
  validates :difficulty, presence: true
end
