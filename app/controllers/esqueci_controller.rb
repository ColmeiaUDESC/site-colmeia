class EsqueciController < ApplicationController
    layout 'login_register'
    before_action :user_params, only: %i[ update gerarCodigo ]
    
    def index
        @page_title = 'Colmeia | Esqueci senha'
        @id = params[:id]
        # Redireciona o usuario para root se estiver logado
        if session[:user_id]
            redirect_to root_path
        end
    end

    def gerarCodigo
      codigo = SecureRandom.base58(10)
      @user = User.find_by(email: params[:email])
      if @user
        @user.codigo = ::Digest::SHA256.hexdigest(codigo);
        @user.data_codigo = DateTime.now
        @user.save

        EsqueciMailer.mandarCodigo(@user.email, codigo).deliver_now
        
        redirect_to esqueci_path(id: 'codigo'), success: 'Código enviado com sucesso!'
      else
        redirect_to esqueci_path(id: 'email'), error: 'Erro!'
      end
    end

    def update
      @user = User.find_by(codigo: ::Digest::SHA256.hexdigest(params[:codigo]))
      if @user==nil
        redirect_to esqueci_path(id: 'codigo'), error: 'Erro!'
        return
      end
      min = 16
      if (@user.data_codigo!=nil)
        min = ((DateTime.now - @user.data_codigo.to_datetime) * 24 * 60).to_i
      end
    
      if (min<20) # caso codigo seja 20 min velho nao 
        if @user.update(password: params[:password], password_confirmation: params[:password_confirmation])
          @user.update(codigo: nil, data_codigo: nil)
          redirect_to login_path, success: 'Senha atualizada com sucesso!'
        else
          redirect_to esqueci_path(id: 'codigo'), error: @user.errors.messages.first.second.second || @user.errors.messages.first.second
        end
      else
        redirect_to esqueci_path(id: 'codigo'), error: 'Erro código inválido!'
      end
    end

    def user_params
      params.permit(:email, :codigo, :password, :password_confirmation)
    end
end
