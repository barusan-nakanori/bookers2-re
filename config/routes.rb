Rails.application.routes.draw do
	devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  root 'homes#top'
  get 'home/about', to: 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
