Rails.application.routes.draw do
  get '/recruits/my_team_index', to: 'recruits#my_team_index'
  resources :recruits ,except: [:new] do
  member do
    get 'new'
  end
end
  get '/teams/list', to: 'teams#list'
  resources :teams do
    member do
      get 'management_show'
    end
  end
  get '/users/profile_edit', to: 'users#profile_edit'
  get '/users/profile_show', to: 'users#profile_show'
    resources :users
  namespace :admin do
   resources :users
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'users#index'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
