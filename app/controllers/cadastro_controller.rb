class CadastroController < ApplicationController
    def index
        @user = User.new
    end

    def create
        # Para acessar os parametros individualmente se usa params[:parametro]
        @user = User.new(params[:user])
        redirect_to :root
    end
end
