class Movie < ApplicationRecord
  # Validations
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :rating, presence: true
  validates :poster_url, presence: true
  # Associations
  has_many :bookmarks

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    if bookmarks.exists?
      errors.add('cannot be deleted because it has associated bookmarks')
      return false
    end
  end
end
