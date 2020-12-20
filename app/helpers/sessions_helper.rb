module SessionsHelper
  def current_user
    if session[:login].present?
      #如果session存在
      @_user9487 ||= User.find_by(id: session[:login])
      # 如果實體變數有東西就給current_user，透過 session 去找到登入的id
    else
      nil
    end
  end

  def user_signed_in?
    if current_user
      return true
    else
      return false
    end
  end
end
