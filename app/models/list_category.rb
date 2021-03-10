class ListCategory < ApplicationRecord
  # 中間テーブルとしてのアソシエーション
  belongs_to :list
  belongs_to :category
end
