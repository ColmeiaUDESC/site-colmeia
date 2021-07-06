class CadastroController < ApplicationController
    def index
        @user = User.new
        render layout: 'login_register'
    end

    def create
        # Para acessar os parametros individualmente se usa params[:parametro]
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path, notice: "Conta criada com sucesso"
        else
            redirect_to cadastro_url, error: @user.errors.full_messages
        end
    end

    def user_params
        params.permit(:email,:password,:data_de_inicio,:name,:situacao)
    end
end
