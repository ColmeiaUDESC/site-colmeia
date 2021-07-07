Rails.application.routes.draw do
  # Exemplo: get:'test', to:'test#index'
  # Ler primeiro tópico do docs.md
  root 'main#index'

  # CADASTRO
  get 'cadastro', to: 'cadastro#new'
  post 'cadastro' , to: 'cadastro#create'

  # LOGIN
  get 'login', to: 'sessions#new'
  post 'login' , to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
  
  get 'membros', to: 'membros#index'
  
  get 'projetos', to: 'projetos#index'

  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/posts', to: 'dashboard#list_posts'
  get 'dashboard/posts/new', to: 'dashboard#new_post'
  get 'dashboard/posts/:id/edit', to: 'dashboard#edit_post', as: 'edit_post'
  get 'dashboard/users', to: 'dashboard#list_users'

  resources :posts, except: [:index, :update, :destroy]
  get 'posts/pag/:pag', to: 'posts#index', as: 'posts_pag'
  put 'posts/:id', to: 'posts#update', as: 'post_update'
  delete 'posts/:id', to: 'posts#destroy', as: 'post_destroy'
end
