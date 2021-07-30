class HistoriaController < ApplicationController
    before_action :historia_params, only: %i[ update ]
    before_action :set_historia, only: %i[ update ]

    def update
        respond_to do |format|
            if @historia.update(historia_params)
              format.html { redirect_to list_info_path, success: 'História atualizada com sucesso!' }
              format.json { render :show, status: :ok, location: @historia }
            else
              format.html { redirect_to list_info_path, error: @historia.errors.messages.first.second }
              format.json { render json: @historia.errors, error: @historia.errors.messages.first.second }
            end
        end
    end

private
    def set_historia
        @historia = Artefato.first
    end

    def historia_params
        params.permit(:texto)
    end

end
