class ApplicationController < ActionController::Base

  # これは削除すべきかもしれない
  protect_from_forgery with: :null_session
  # ユーザー登録・ログイン認証の前にconfigure_permitted_parametersを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 呼び出された他のコントローラからも参照可能
  protected
  def configure_permitted_parameters
  # sign_upの時にname（ユーザー名）を操作可能に
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
