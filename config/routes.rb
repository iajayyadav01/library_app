Rails.application.routes.draw do
  get 'welcome/index' => 'welcome#index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
  resources :authors
end
