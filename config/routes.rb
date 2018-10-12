Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :search, only: [:index] do
  	collection do
  		get 'results'
  	end
  end

  get 'about', to: 'amiibo#about', as: 'about'
  get 'amiibo', to: 'amiibo#list', as: 'amiibo_list'
  get 'amiibo/:id', to: 'amiibo#show', as: 'amiibo'

  root to: 'amiibo#index'
end
