Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#index'

  get 'login', to: 'login#index'
  
  get 'cadastro', to: 'cadastro#index'

  get 'membros', to: 'membros#index'

  get 'projetos', to: 'projetos#index'
end
