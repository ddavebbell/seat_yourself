Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'restaurants#index'



	resources :restaurants do
	 resources :reservations
 end
  resources :users

  get 'restaurants/:id/edit', to: 'restaurants#edit'

  # Login & Sessions
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
