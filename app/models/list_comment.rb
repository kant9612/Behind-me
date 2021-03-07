class ListComment < ApplicationRecord
  # ユーザーに紐づくコメント
  belongs_to :user
  # リストに紐づくコメント
  belongs_to :list
  # 空のコメントは投稿できない
  validates :comment, presence: true
end
