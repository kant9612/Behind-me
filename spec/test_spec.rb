# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, "モデルに関するテスト", type: :model do
#   describe '実際に保存してみる' do
#     it "有効な投稿内容の場合は保存されるか" do
#       expect(FactoryBot.build(:list)).to be_valid
#     end
# 	end
  context "空白のバリデーションチェック" do
    it "list_titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      list = List.new(list_title: '', description:'hoge')
      expect(list).to be_invalid
      expect(list.errors[:list_title]).to include("を入力してください")
    end
    it "descriptionが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      list = List.new(list_title: 'hoge', description:'')
      expect(list).to be_invalid
      expect(list.errors[:description]).to include("を入力してください")
    end
  end
end