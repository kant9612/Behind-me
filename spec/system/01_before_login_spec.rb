require 'rails_helper'

describe 'ユーザログイン前のテスト', :type => :system do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'ログインリンクが表示される: 左上から5番目のリンクが「ログイン」である' do
        log_in_link = find_all('a')[8].native.inner_text
        expect(log_in_link).to match("ログイン")
      end
      it 'ログインリンクの内容が正しい' do
        log_in_link = find_all('a')[5].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
      end
      it '新規会員登録リンクが表示される: 左上から6番目のリンクが「新規会員登録」である' do
        sign_up_link = find_all('a')[6].native.inner_text
        expect(sign_up_link).to match("新規会員登録")
      end
      it '新規会員登録リンクの内容が正しい' do
        sign_up_link = find_all('a')[6].native.inner_text
        expect(page).to have_link sign_up_link, href: new_user_registration_path
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/home/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/home/about'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'Bhind-Me'
      end
      it 'トップページリンクが表示される: 左上から2番目のリンクが「トップページ」である' do
        about_link = find_all('a')[2].native.inner_text
        expect(about_link).to match("トップページ")
      end
      it 'Aboutページへのリンクが表示される: 左上から4番目のリンクが「Bhind-Meについて」である' do
        login_link = find_all('a')[4].native.inner_text
        expect(login_link).to match("Bhind-Meについて")
      end
      it '新規会員登録リンクが表示される: 左上から6番目のリンクが「新規会員登録」である' do
        signup_link = find_all('a')[6].native.inner_text
        expect(signup_link).to match("新規会員登録")
      end
      it 'ログインリンクが表示される: 左上から8番目のリンクが「ログイン」である' do
        home_link = find_all('a')[8].native.inner_text
        expect(home_link).to match("ログイン")
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'トップページを押すと、トップページ画面に遷移する' do
        about_link = find_all('a')[2].native.inner_text
        about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link about_link
        is_expected.to eq '/'
      end
      it '新規会員登録を押すと、新規登録画面に遷移する' do
        signup_link = find_all('a')[6].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link, match: :first
        is_expected.to eq '/users/sign_up'
      end
      it 'ログインを押すと、ログイン画面に遷移する' do
        signin_link = find_all('a')[8].native.inner_text
        signin_link = signin_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signin_link, match: :first
        is_expected.to eq '/users/sign_in'
      end
      it '"Bhind-Meについて"を押すと、About画面に遷移する' do
        login_link = find_all('a')[4].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link
        is_expected.to eq '/home/about'
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規会員登録」と表示される' do
        expect(page).to have_content '新規会員登録'
      end
      it '名前フォームが表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'メールフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'パスワードフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it '確認用パスワードフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '登録完了ボタンが表示される' do
        expect(page).to have_button '完了'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end
    end
  end

  describe 'ユーザログイン' do
    let(:user) { FactoryBot.create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it '「会員登録がまだお済みでない方はこちら」と表示される' do
        expect(page).to have_content '会員登録がまだお済みでない方はこちら'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { FactoryBot.create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'Bhind-Me'
      end
      it 'トップページリンクが表示される: 左上から1番目のリンクが「トップページ」である' do
        home_link = find_all('a')[2].native.inner_text
        expect(home_link).to match("トップページ")
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:user) { FactoryBot.create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      logout_link = find_all('a')[4].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
        expect(page).to have_link '', href: '/home/about'
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq "/home/about"
      end
    end
  end
end