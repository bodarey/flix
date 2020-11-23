Rails.application.routes.draw do
  
  
  resources :genres
  resources :users
  root 'movies#index'
  get '/signup' => 'users#new'
  #get 'index' =>'movies#index', as: 'index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 #  get 'movies'=> 'movies#index', as: 'movies'
 #   get 'movies/new' => 'movies#new', as: 'new_movie'
 #  get 'movies/:id'=>'movies#show', as: 'movie'
 #  get 'movies/:id/edit' =>'movies#edit',as: 'edit_movie'
 # patch 'movies/:id'=> 'movies#update'
 # post 'movies' => 'movies#create'

 get 'movies/filter/:scope' => 'movies#index', as: 'filtered_movies'
 get '/signin'=> 'sessions#new'
  resource :session
    resources :movies do
    resources :reviews
    resources :favorites
  end

end
