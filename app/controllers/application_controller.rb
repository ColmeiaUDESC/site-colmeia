class ApplicationController < ActionController::Base
  add_flash_types :error, :warning, :success, :info
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
      # se o usuario nao existir mais desloga ele e manda pra tela principal
      if !Current.user
        session[:user_id] = nil
        redirect_to root_path
      end
    end
  end

end
