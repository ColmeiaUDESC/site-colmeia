class UserController < ApplicationController
    before_action :set_user, only: %i[ update destroy updateFromDash ]
    before_action :dont_delete_itself, only: %i[ destroy ]


    def update
      if Current.user.situacao=="Visitante"
        params = user_params_visitante
      elsif Current.user.situacao!="Bolsista" && !Current.user.admin
        params = user_params.except(:situacao)
      else 
        params = user_params
      end
      respond_to do |format|
        if @user.update(params)
          format.html { redirect_to perfil_path, success: 'Usuário atualizado com sucesso!' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to perfil_path, error: @user.errors.full_messages }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end


    def updateSenha
      user = User.find(session[:user_id]) rescue nil
      respond_to do |format|
        if !user.authenticate(params[:senha_atual]) 
          format.html { redirect_to perfil_path, error: 'Senha atual incorreta!' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        elsif user.update(password: params[:password], password_confirmation: params[:password_confirmation])
          format.html { redirect_to perfil_path, success: 'Senha atualizada com sucesso!' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to perfil_path, error: @user.errors.messages.first.second }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def updateFromDash
      if Current.user.situacao!="Bolsista" && !Current.user.admin
        params = user_params.except(:situacao, :admin)
      else 
        params = user_params
      end
      respond_to do |format|
        if @user.update(params)
          format.html { redirect_to dashboard_users_path, success: 'Usuário atualizado com sucesso!'}
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to dashboard_users_path, error: @user.errors.full_messages }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # DELETE /posts/1 or /posts/1.json
    def destroy
      comentarios = Comentario.where("user_id = "+(@user.id).to_s)
      comentarios.each do |comentario|
        comentario.destroy
      end
      @user.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_users_path, success: 'Usuário deletado com sucesso!' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id]) rescue nil
        if @user
          if User.find(session[:user_id]).situacao != "Bolsista" && !User.find(session[:user_id]).admin && Current.user.id!=@user.id
              redirect_to request.referer, error: "Você não pode editar esse usuário!"
          end
        else
          redirect_to request.referer, error: "Erro. Usuário inválido"
        end
      end

      def dont_delete_itself
        if Current.user.id==@user.id
          redirect_to request.referer, error: "Você não pode excluir seu próprio perfil!"
        end
      end
  
      # Only allow a list of trusted parameters through.
      def user_params_visitante
        params.permit(:nome, :sobrenome, :email, :password, :password_confirmation, :imagem_url)
      end
      def user_params
        params.permit(:nome, :sobrenome, :email, :password, :password_confirmation, :situacao, :admin, :imagem_url, :desc, :github_username, :instagram_username, :twitter_username, :discord_username)
      end


end
