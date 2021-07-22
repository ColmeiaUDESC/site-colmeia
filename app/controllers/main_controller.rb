class MainController < ApplicationController
  
  def index
    @page_title = 'Colmeia | Página principal'
    @linker = Link.last()
  end

end
