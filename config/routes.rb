Rails.application.routes.draw do
  get 'questions/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root :to => 'users#index'
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  get 'logout' => 'user_sessions#destroy', :as => :logout   

  get "/dashboard", to: "dashboard#index"

  # Survey routes
  resources :surveys
  resources :questions
  resources :answers
  resources :link_surveys
  resources :user_answers

  get '/user-survey/:id', :to => 'user_answers#questions'
  get '/user-response', :to => 'user_answers#userResponse'
  get '/user-response/:user_id/:survey_id', :to => 'user_answers#userResponseDetail'

end
