class MembrosController < ApplicationController
  def index
    @page_title = 'Colmeia | Membros'
    @membros = []

    User.all.each do |user|
      if user.situacao != 'Visitante'
        @membros << user
      end
    end
  end
end