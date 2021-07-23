class HistoriaController < ApplicationController
    before_action :historia_params, only: %i[ update ]
    before_action :set_historia, only: %i[ update ]

    def update
        respond_to do |format|
            if @historia.update(historia_params)
              format.html { redirect_to list_info_path, success: 'História atualizada com sucesso!' }
              format.json { render :show, status: :ok, location: @historia }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @historia.errors, status: :unprocessable_entity }
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
