Rails.application.routes.draw do
  # Exemplo: get:'test', to:'test#index'
  # Ler primeiro tópico do docs.md
  
    root 'main#index'

    # SIGN_UP
    get "sign_up", to: "registrations#new"
    post "sign_up" , to: "registrations#create"

    # SIGN_IN
    get "sign_in", to: "sessions#new" 
    post "sign_in" , to: "sessions#create"

end
