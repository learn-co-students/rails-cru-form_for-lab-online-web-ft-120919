Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :artists, only: [:new, :show, :index, :create, :update, :edit] 

resources :songs, only: [:new, :show, :index, :create, :update, :edit] 

resources :genres, only: [:new, :show, :index, :create, :update, :edit] 
end
