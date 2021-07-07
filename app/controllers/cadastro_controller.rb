class CadastroController < ApplicationController
    layout 'login_register'
    
    def index
        @page_title = 'Colmeia | Cadastro'
        # Redireciona o usuario para root se estiver logado
        if session[:user_id]
            redirect_to root_path
        end
    end

    def create
      # Para acessar os parametros individualmente se usa params[:parametro]
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path
      else
        redirect_to cadastro_url, error: @user.errors.full_messages
      end

    end

    def user_params
      params.permit(:email, :password, :password_confirmation, :name, :sobrenome)
    end
end
