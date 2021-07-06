class MembrosController < ApplicationController
  def index
    @membros = []

    User.all.each do |user|
      if user.situacao != 'Visitante'
        @membros << user
      end
    end
  end
end