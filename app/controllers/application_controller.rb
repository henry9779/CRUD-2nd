class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  #如果這個 controller 任何一個 action 出現這個錯誤就用 with 後面的方法解決

  private

  def record_not_found
    render file: 'public/404.html', layout: false, status: 404
    #轉址檔案到public/404.html,不要有layout,設定狀態為404
  end

end
