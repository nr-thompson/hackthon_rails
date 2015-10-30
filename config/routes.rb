Rails.application.routes.draw do
 
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  get '/home' => 'users#home'
  post '/users' => 'users#create'
  get '/index' => 'users#index'



  ##### Routes for omniauth #####
  get "auth/:provider/callback", to: "sessions#fb_create"
  get "auth/failure", to: redirect("/home")
  root "sessions#new"
  ##### end of omniauth routes ######


  ##### Routes for Login ######
  get "/users/login" => "users#login"
  
  ##### end of login routes ######

  post '/interests' => 'interests#create'
end
