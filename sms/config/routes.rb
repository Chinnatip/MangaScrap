Rails.application.routes.draw do
  root 'updates#index'
  resources :updates
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
