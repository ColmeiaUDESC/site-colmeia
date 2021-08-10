class SenhaController < ApplicationController
    def create
        @senha = Senha.new(senha_params)

        respond_to do |format|
          if @senha.save
            format.html { redirect_to '/dashboard/senha', success: 'Senha adicionada com sucesso!' }
            format.json { render :show, status: :created, location: @senha }
          else
            format.html { redirect_to '/dashboard/senha', error: @senha.errors.messages[:nome] }
            format.json { render json: @senha.errors, status: :unprocessable_entity }
          end
        end
    end

    def senha_params
        params.permit(:senha,:plataforma,:link,:usuario)
    end
    
    def update
      @senha = Senha.find(params[:id])

      respond_to do |format|
        if @senha.update(senha_params)
          format.html { redirect_to senhas_path, success: 'Senha atualizada com sucesso!' }
          format.json { render :show, status: :ok, location: @senha }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @senha.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      Senha.find(params[:id]).destroy

      respond_to do |format|
        format.html { redirect_to dashboard_posts_path, success: 'Senha removida com sucesso!' }
        format.json { head :no_content }
      end
    end

end