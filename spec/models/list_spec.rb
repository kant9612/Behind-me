require 'rails_helper'

RSpec.describe 'Listモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { list.valid? }

    let(:user) { FactoryBot.create(:user) }
    let!(:list) { FactoryBot.build(:list, user_id: user.id) }

    context 'list_titleカラム' do
      it '空欄でないこと' do
        list.list_title = ''
        is_expected.to eq false
      end
    end

    context 'descriptionカラム' do
      it '空欄でないこと' do
        list.description = ''
        is_expected.to eq false
      end
      it '800文字以下であること: 800文字は〇' do
        list.description = Faker::Lorem.characters(number: 800)
        is_expected.to eq true
      end
      it '800文字以下であること: 801文字は×' do
        list.description = Faker::Lorem.characters(number: 801)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(List.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end