class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # userに紐づいている（user消えたらリストも消える）
  has_many :lists, dependent: :destroy
  attachment :profile_image
end
