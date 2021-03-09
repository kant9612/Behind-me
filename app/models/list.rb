class List < ApplicationRecord
  # userに紐づいている（user消えたらリストも消える）
  belongs_to :user
  # list一つ一つにmovieがいくつか紐付いている
  has_many :movies, dependent: :destroy
  # list一つ一つにコメントがいくつか紐づいている
  has_many :list_comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  # 画像アップ用のメソッド
  attachment :image
  # バリデーション
  validates :title, presence: true
  validates :description, presence: true

  def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
