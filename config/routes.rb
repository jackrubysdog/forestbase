Forestbase::Application.routes.draw do

  get "records/show"

  match "/home"    => 'pages#home'
  
  match "/seasons" => 'seasons#index'
  match '/seasons/:id', :to => 'seasons#show' , :as => :season

  resources :players
  
  match "/opponents" => 'opponents#index'
  match '/opponents/:id', :to => 'opponents#show' , :as => :opponent
  
  resources :oppplayers
  
  match '/leaders' => 'leaders#show'

  match '/records' => 'records#show'
  
  resources :matches
  
  resources :managers

  resources :internationals
 
  root :to => 'pages#home'
end
