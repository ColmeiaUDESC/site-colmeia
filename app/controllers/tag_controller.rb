class TagController < ApplicationController
    before_action :is_bolsista, only: %i[ update destroy ]
    before_action :not_visitante, only: %i[ create ]
    before_action :set_tag, only: %i[ update destroy ]

  # POST /tag or /tag.json
  def create
    @tag = Tag.new(tag_params)
    puts @tag
    @tag.nome = @tag.nome.upcase

    respond_to do |format|
      if @tag.save
        format.html { redirect_to '/dashboard/tags', success: 'Tag criada com sucesso!' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag/1 or /tag/1.json
  def update
    respond_to do |format|
      if @tag.update(nome: params[:nome].upcase)
        format.html { redirect_to '/dashboard/tags', success: 'Tag atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag/1 or /tag/1.json
  def destroy
    regs = PostsTag.where("tag_id == "+@tag.id)
    regs.each do |reg|
      reg.destroy
    end
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to '/dashboard/tags', success: 'Tag destruida com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def is_bolsista
      if Current.user.situacao!="Bolsista"
        redirect_to request.referer, error: "Permissão negada!"
      end    
    end

    def not_visitante
      if Current.user.situacao=="Visitante"
        redirect_to request.referer, error: "Permissão negada!"
      end    
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.permit(:nome)
    end


end
