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
        redirect_to root_path, notice: "Conta criada com sucesso"
      else
        render :index
      end

    end

    def user_params
      params.permit(:nome, :sobrenome, :email, :password, :password_confirmation)
    end
end
