class DashboardController < ApplicationController
  layout 'dashboard'
  
    def index
      @page_title = 'Colmeia | Dashboard'

      if !Current.user || Current.user.situacao == 'Visitante'
        redirect_to root_path, notice: "Acesso inválido"
      end
    end
end
