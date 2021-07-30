class TagController < ApplicationController
  before_action :is_bolsista, only: %i[ update destroy ]
  before_action :not_visitante, only: %i[ create tagToPosts destroy ]
  before_action :set_tag, only: %i[ update destroy ]
  before_action :tag_not_null, only: %i[ tagToPosts ]

  # POST /tag or /tag.json
  def create
    @tag = Tag.new(tag_params)
    puts @tag
    @tag.nome = @tag.nome.upcase.strip

    respond_to do |format|
      if @tag.save
        format.html { redirect_to '/dashboard/tags', success: 'Tag criada com sucesso!' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { redirect_to '/dashboard/tags', error: @tag.errors.messages[:nome] }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag/1 or /tag/1.json
  def tagToPosts
    posts = params[:posts].split(',')
    posts.each do |post|
      if (!PostsTag.exists?(post_id: post, tag_id: params[:tag].to_s) && PostsTag.where(:post_id => post).count < 4)
        PostsTag.create(post_id: post, tag_id: params[:tag])
      end
    end
    respond_to do |format|
      format.html { redirect_to '/dashboard/tags', success: 'Tag adicionada com sucesso!' }
      format.json { head :no_content }
    end
  end

  # DELETE /tag/1 or /tag/1.json
  def destroy
    regs = PostsTag.where("tag_id = "+@tag.id.to_s)
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

    def tag_not_null
      if params[:posts]==""
        redirect_to request.referer, error: "Tag inválida!"
      end
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.permit(:nome)
    end


end
