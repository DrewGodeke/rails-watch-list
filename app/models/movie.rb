# app/models/movie.rb
class Movie < ApplicationRecord
  # Associations
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks
end
