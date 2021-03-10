class Category < ApplicationRecord
  # listとのアソシエーション（list_categoryを中間テーブルとする多対多）
  has_many :list_categories
  has_many :lists, through: :list_categories
end
