class ProjetosController < ApplicationController
  before_action :set_proj, only: %i[ update destroy ]
  before_action :not_visitante, only: %i[ create update destroy ]

  def index
    @page_title = 'Colmeia | Projetos'
    @projetos = Projeto.all.order("created_at DESC")
  end

  # POST /projeto or /projeto.json
  def create
    @proj = Projeto.new(proj_params)
    puts @proj
    respond_to do |format|
      if @proj.save
        format.html { redirect_to dash_proj_path, success: 'Projeto criado com sucesso!' }
        format.json { render :show, status: :created, location: @proj }
      else
        format.html { redirect_to dash_proj_path, error: @proj.errors.messages.first.second }
        format.json { render json: @proj.errors, error: @proj.errors.messages.first.second}
      end
    end
  end

  # PATCH/PUT /projeto/1 or /projeto/1.json
  def update
    respond_to do |format|
      if @proj.update(proj_params)
        format.html { redirect_to dash_proj_path, success: 'Projeto atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @proj }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projeto/1 or /projeto/1.json
  def destroy
    @proj.destroy
    respond_to do |format|
      format.html { redirect_to dash_proj_path, success: 'Projeto destruido com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proj
      @proj = Projeto.find(params[:id])
    end

    def not_visitante
      if Current.user.situacao=="Visitante"
        redirect_to request.referer, error: "Permissão negada!"
      end    
    end

    # Only allow a list of trusted parameters through.
    def proj_params
      params.permit(:titulo, :desc, :img_url, :git_url)
    end

end