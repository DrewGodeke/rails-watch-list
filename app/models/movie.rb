class Movie < ApplicationRecord
  # Validations
  validates :title, presence: true, uniqueness: true

  # Associations
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks
end
