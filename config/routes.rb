Rails.application.routes.draw do
  resources :recruits do
      resources :recruit_comments, only: [:create, :destroy]
      get 'my_team_index', on: :member
      get 'my_team_show', on: :member
  end

  get '/teams/search', to: 'teams#search'
  resources :teams do
    member do
      get 'management_show'
      get '/user_teams/member'
      get '/user_teams/recruit_member'
    end
    resources :user_teams do
      member do
        patch '/user_teams/recruit_member_update', to: 'user_teams#recruit_member_update'
        put '/user_teams/recruit_member_update', to: 'user_teams#recruit_member_update'
      end
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
