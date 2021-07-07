class DashboardController < ApplicationController
  layout 'dashboard'
  
    def index
      @page_title = 'Colmeia | Dashboard'

      if !Current.user || Current.user.situacao == 'Visitante'
        redirect_to root_path, notice: "Acesso inválido"
      end
    end

    def list_posts
      @page_title = 'Colmeia | Listagem de posts'
    end

    def new_post
      @page_title = 'Colmeia | Nova postagem'
    end

    def list_users
      @page_title = 'Colmeia | Listagem de usuários'
    end
end
