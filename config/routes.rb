Rails.application.routes.draw do
  # Exemplo: get:'test', to:'test#index'
  # Ler primeiro tópico do docs.md
  root 'main#index'

  # CADASTRO
  get 'cadastro', to: 'cadastro#index'
  post 'cadastro' , to: 'cadastro#create'

  # LOGIN
  get 'login', to: 'sessions#new'
  post 'login' , to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
  
  get 'membros', to: 'membros#index'
  
  get 'projetos', to: 'projetos#index'

  get 'perfil', to: 'perfil#index'

  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/posts', to: 'dashboard#list_posts'
  get 'dashboard/posts/new', to: 'dashboard#new_post'
  get 'dashboard/posts/:id/edit', to: 'dashboard#edit_post', as: 'edit_post'
  get 'dashboard/users', to: 'dashboard#list_users'
  get 'dashboard/users/:id/edit', to: 'dashboard#edit_user', as: 'edit_user'
  get 'dashboard/tags', to: 'dashboard#tags', as: 'dash_tags'
  get 'dashboard/info', to: 'dashboard#list_info', as:'list_info'
  get 'dashboard/projetos', to: 'dashboard#projetos', as:'dash_proj'
  get 'dashboard/projetos/new', to: 'dashboard#new_proj', as:'new_proj'
  get 'dashboard/projetos/:id/edit', to: 'dashboard#edit_proj', as:'edit_proj'

  # Info
  get 'linker', to: 'dashboard#edit_linker', as: 'edit_linker'
  put 'linker', to:'link#update', as:"linker_update"
  get 'historia', to: 'dashboard#edit_historia', as: 'edit_historia'
  put 'historia', to: 'historia#update', as: 'historia_update'
  get 'somos', to: 'dashboard#edit_somos', as: 'edit_somos'
  put 'somos', to: 'somos#update', as: 'somos_update'

  # Posts
  post 'blog', to: 'posts#create', as: 'posts'
  get 'blog/:id', to: 'posts#show', as: 'post'
  get 'blog/p/:pag(/:tag)', to: 'posts#index', as: 'posts_pag'
  put 'blog/:id', to: 'posts#update', as: 'post_update'
  delete 'blog/:id', to: 'posts#destroy', as: 'post_destroy'

  # Comentario
  post 'comentario/:post_id', to: 'comentarios#create', as: 'comentario'
  delete 'comentario/:id', to: 'comentarios#destroy', as: 'comentario_destroy'

  # User
  put 'user/:id', to: 'user#update', as: 'user_update'
  put 'user', to: 'user#updateSenha', as: 'user_update_senha'
  put 'dashboard/users/:id', to: 'user#updateFromDash', as: 'user_dash_update'
  delete 'user/:id', to: 'user#destroy', as: 'user_destroy'

  # Tag
  post 'tag', to: 'tag#create', as: 'tag'
  put 'tag', to: 'tag#tagToPosts', as: 'tag_to_posts'
  delete 'tag/:id', to: 'tag#destroy', as: 'tag_destroy'

  # Projeto
  post 'projeto', to: 'projetos#create', as: 'proj'
  put 'projeto/:id', to: 'projetos#update', as: 'proj_update'
  delete 'projeto/:id', to: 'projetos#destroy', as: 'proj_destroy'
  
  # Senhas
  get 'dashboard/senha', to: 'dashboard#senhas', as:'senhas'
  post 'senha', to: 'senha#create', as: 'senha_add'
  get 'dashboard/senha/:id/edit', to: 'dashboard#edit_senha', as: 'edit_senha'
  put 'senha/:id', to: 'senha#update', as: 'senha_update'
  delete 'senha/:id', to: 'senha#destroy', as: 'senha_destroy'
  
   # Esqueci senha
  get 'esqueci/:id', to: 'esqueci#index', as: 'esqueci'
  post 'esqueci/gerarcodigo' , to: 'esqueci#gerarCodigo'
  put 'esqueci', to: 'esqueci#update', as: 'esqueci_update'
end
