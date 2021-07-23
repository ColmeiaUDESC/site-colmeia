class SomosController < ApplicationController
    before_action :somos_params, only: %i[ update ]
    before_action :set_somos, only: %i[ update ]

    def update
        respond_to do |format|
            if @somos.update(somos_params)
              format.html { redirect_to list_info_path, success: 'Quem somos atualizado com sucesso!' }
              format.json { render :show, status: :ok, location: @somos }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @somos.errors, status: :unprocessable_entity }
            end
        end
    end

private
    def set_somos
        @somos = Artefato.last
    end

    def somos_params
        params.permit(:texto)
    end

end
