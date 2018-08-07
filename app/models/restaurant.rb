class Restaurant < ApplicationRecord
  CATEGORIES = ['chinese', 'japanese', 'french', 'belgian', 'italian']
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
