class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # userに紐づいている（user消えたらリストも消える）
  has_many :lists, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :list_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  attachment :profile_image
  # バリデーション
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end
