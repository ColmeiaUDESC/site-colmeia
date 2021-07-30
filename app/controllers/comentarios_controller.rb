class ComentariosController < ApplicationController
    before_action :require_user
    before_action :set_comentario, only: %i[ destroy ]
    before_action :require_user_be_owner, only: %i[ destroy ]

    # POST /comentario
    def create
        
      @comentario = Comentario.new(comentario: params[:comentario], post_id: params[:post_id], user_id: session[:user_id])
      puts @comentario
  
      respond_to do |format|
        if @comentario.save
          format.html { redirect_to post_path(id: params[:post_id]), success: 'Comentario criado com sucesso!' }
          format.json { render :show, status: :created, location: @comentario }
        else
          format.html { redirect_to post_path(id: params[:post_id]), error: @comentario.errors.messages.first.second}
          format.json { render json: @comentario.errors, status: :unprocessable_entity }
        end
      end
    end

  
    # DELETE /comentario/1
    def destroy
      @comentario.destroy
      respond_to do |format|
        format.html { redirect_to request.referer, success: 'Comentário destruido com sucesso!' }
        format.json { head :no_content }
      end
    end
  
    private
      def require_user
        if (!session[:user_id])
            redirect_to post_path(id: params[:post_id]), error: "Voce precisa estar logado para comentar"
        end
      end

      def require_user_be_owner
        if User.find(session[:user_id]).situacao != "Bolsista" && @comentario.user_id != session[:user_id]
            redirect_to request.referer, error: "Voce não pode excluir um comentário que não é seu!"
        end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_comentario
        @comentario = Comentario.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def comentario_params
        params.permit(:comentario)
      end
  end
  