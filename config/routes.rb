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

end
