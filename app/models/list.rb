class List < ApplicationRecord
  # userに紐づいている（user消えたらリストも消える）
  belongs_to :user
  # list一つ一つにmovieがいくつか紐付いている
  has_many :movies, dependent: :destroy
  # list一つ一つにコメントがいくつか紐づいている
  has_many :list_comments, dependent: :destroy
  # 画像アップ用のメソッド
  attachment :image
end
