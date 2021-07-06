class SessionsController < ApplicationController
  layout 'login_register'
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logado com sucesso'
    else
      # flash[:alert] = 'Email ou senha inválidos'
      # render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logout realizado com sucesso'
  end
end