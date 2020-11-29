module SessionsHelper
  def current_user
    @user ||= User.find_by(email: session[:login])
    # 如果實體變數有東西就給current_user，透過 session 去找到登入的 email
  end
end