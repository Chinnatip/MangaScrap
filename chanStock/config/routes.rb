Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stock
  get 'bg' ,   to: 'stock#bg'
  get 'trend', to: 'stock#trend'
  root 'stock#index'
end
