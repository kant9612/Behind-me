class Movie < ApplicationRecord
  # listにmovieが紐付いている
  belongs_to :lists
  validates :title, presence: true
end
