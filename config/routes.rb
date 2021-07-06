Rails.application.routes.draw do
  # Exemplo: get:'test', to:'test#index'
  # Ler primeiro tópico do docs.md
    root 'main#index'

    # SIGN_UP
    get "cadastro", to: "cadastro#new"
    post "cadastro" , to: "cadastro#create"

    # SIGN_IN
    get "sessions", to: "sessions#new"
    post "sessions" , to: "sessions#create"
  
    get 'membros', to: 'membros#index'

    get 'projetos', to: 'projetos#index'
end
