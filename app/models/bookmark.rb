# app/models/bookmark.rb
class Bookmark < ApplicationRecord
  # Validations
  validates :comment, presence: true

  # Associations
  belongs_to :movie
  belongs_to :list

  # Custom validation to ensure uniqueness of bookmark per list and movie
  validates :movie_id, uniqueness: { scope: :list_id }
end
