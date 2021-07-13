class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @pag = params[:pag].to_i
    @tag = params[:tag]
    # Caso alguem queira ver uma pagina menor q 1 default pra 1, pq se n da erro
    if @pag<1 then @pag=1 end
    if @tag 
      tagString = ""
      tags = @tag.split('e')
      len = tags.length
      tags.each_with_index do |tag, index|
        if (index+1==len) then
          tagString+='posts_tags.tag_id = '+tag
        else
          tagString+='posts_tags.tag_id = '+tag+' OR '
        end
      end
      @posts = Post.joins(:postsTag).where(tagString).offset(4*(@pag-1)).order("created_at DESC").first(4)
    else
      @posts = Post.offset(4*(@pag-1)).order("created_at DESC").first(4)
    end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    puts @post
    respond_to do |format|
      if @post.save
        tags = params[:tags].split(',')
        tags.each do |tag|
          @post.postsTag.create(post_id: @post.id, tag_id: tag)
        end
        format.html { redirect_to '/dashboard/posts', success: 'Post criado com sucesso!' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        sqlString = ''
        tags = params[:tags].split(',')
        len = tags.length
        tags.each_with_index do |tag, index|
          if @post.postsTag.find_by(tag_id:tag)==nil then
            @post.postsTag.create(post_id: @post.id, tag_id: tag)
          end
          if (index+1==len) then
            sqlString+='tag_id != '+tag
          else
            sqlString+='tag_id != '+tag+' AND '
          end
        end
        tagsSobrando = @post.postsTag.where(sqlString)
        tagsSobrando.each do |tag|
          tag.destroy()
        end
        format.html { redirect_to dashboard_posts_path, success: 'Post atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to '/dashboard/posts', success: 'Post destruido com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:title, :desc, :html, :users_name)
    end
end
