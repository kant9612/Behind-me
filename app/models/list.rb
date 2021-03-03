class List < ApplicationRecord
  # userに紐づいている（user消えたらリストも消える）
  belongs_to :user
end
