class DashboardController < ApplicationController
  layout 'dashboard'
  
    def index
      @page_title = 'Colmeia | Dashboard'

      if !Current.user || Current.user.situacao == 'Visitante'
        redirect_to root_path
      end
    end

    def list_posts
      @page_title = 'Colmeia | Listagem de posts'
    end

    def new_post
      @page_title = 'Colmeia | Nova postagem'
    end

    def edit_post
      @page_title = 'Colmeia | Edição de posts'
    end

    def list_users
      @page_title = 'Colmeia | Listagem de usuários'
    end

    def edit_user
      @page_title = 'Colmeia | Edição de usuários'
    end

    def edit_info
      @page_title = 'Colmeia | Edição de informações'
    end

    def edit_historia
      @page_title = 'Colmeia | Edição de Historia'
    end

    def edit_somos
      @page_title = 'Colmeia | Edição de Quem somos'
    end

    def edit_linker
      @page_title = 'Colmeia | Edição de Linker'
    end
end
