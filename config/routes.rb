Rails.application.routes.draw do
  # Exemplo: get:'test', to:'test#index'
  # Ler primeiro tópico do docs.md
    root 'main#index'

    # SIGN_UP
    get "cadastro", to: "cadastro#new"
    post "cadastro" , to: "cadastro#create"

    # SIGN_IN
    get "entre", to: "entre#new"
    post "entre" , to: "entre#create"
  
    get 'membros', to: 'membros#index'

    get 'projetos', to: 'projetos#index'

    resources :posts, except: [:index]

    get 'posts/pag/:pag', to: 'posts#index', as: 'posts_pag'

end
