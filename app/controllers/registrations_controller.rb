class RegistrationsController < ApplicationController
  before_action :session_required, only: [:edit, :update]
  #寫在上層，因為很多會用到

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to root_path, notice: '新增會員成功'
      else
        render :new
      end
  end

  def edit
  end
  
  def update
    if current_user.update(user_params)
      redirect_to edit_users_path, notice: '資料更新成功'
    else
      #
    end
  end




  private
  
  def user_params
    params.require(:user).permit(:email, :password, :nickname, :password_confirmation)
  end
end