Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/users/edit' => 'users#edit', :as => :edit_user
  get '/letters/type/:mood' => 'letters#mood', :as => :letter_type
  resources :users, :except => [:edit]
  resources :letters, :moods

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
