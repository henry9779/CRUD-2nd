class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.login(params[:user])
      # 會將使用者登入資料帶進類別方法裡，把密碼加密後登入
      session[:login] = params[:user][:email]
      # 發 cookie 給使用者
      redirect_to root_path, notice: '登入成功'
    else
      redirect_to session_path, notice: '登入失敗'
    end
  end

  def destroy
    session[:login] = nil
    redirect_to root_path, notice: '你已登出'
  end


end