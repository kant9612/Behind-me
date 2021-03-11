class List < ApplicationRecord
  # userに紐づいている（user消えたらリストも消える）
  belongs_to :user
  # list一つ一つにmovieがいくつか紐付いている
  has_many :movies, dependent: :destroy
  # list一つ一つにコメントがいくつか紐づいている
  has_many :list_comments, dependent: :destroy
  # list一つ一つにいいねがいくつか紐づいている
  has_many :likes, dependent: :destroy
  # likeでランキングを作成するため
  has_many :liked_users, through: :likes, source: :user
  # listとcategoryのアソシエーション（多対多）
  has_many :list_categories
  has_many :categories, through: :list_categories
  # 画像アップ用のメソッド
  attachment :image
  # バリデーション
  validates :list_title, presence: true
  validates :description, presence: true

  def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
