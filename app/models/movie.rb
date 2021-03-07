class Movie < ApplicationRecord
  # listにmovieが紐付いている
  belongs_to :list
  belongs_to :user
  validates :title, presence: true
end
