class LinkController < ApplicationController
    before_action :linker_params, only: %i[ update ]
    before_action :set_linker, only: %i[ update ]

    def update
        respond_to do |format|
            if @linker.update(linker_params)
              format.html { redirect_to edit_linker_path, success: 'Linker atualizado com sucesso!' }
              format.json { render :show, status: :ok, location: @linker }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @linker.errors, status: :unprocessable_entity }
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
