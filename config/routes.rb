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
  get 'dashboard/info', to: 'dashboard#list_info', as:'list_info'

  # Info
  get 'linker', to: 'dashboard#edit_linker', as: 'edit_linker'
  put 'linker', to:'link#update', as:"linker_update"

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
  put 'dashboard/users/:id', to: 'user#updateFromDash', as: 'user_dash_update'
  delete 'user/:id', to: 'user#destroy', as: 'user_destroy'

  # Tag
  post 'tag', to: 'tag#create', as: 'tag'
  put 'tag/:id', to: 'tag#update', as: 'tag_update'
  delete 'tag/:id', to: 'tag#update', as: 'tag_destroy'
end
