class LinkController < ApplicationController
    before_action :linker_params, only: %i[ update ]
    before_action :set_linker, only: %i[ update ]

    def update
        respond_to do |format|
            if @linker.update(linker_params)
              format.html { redirect_to list_info_path, success: 'Linker atualizado com sucesso!' }
              format.json { render :show, status: :ok, location: @linker }
            else
              format.html { redirect_to list_info_path, error: @linker.errors.messages.first.second }
              format.json { render json: @linker.errors, error: @linker.errors.messages.first.second }
            end
        end
    end

private
    def set_linker
        @linker = Link.last
    end

    def linker_params
        params.permit(:texto, :botao, :link)
    end

end
