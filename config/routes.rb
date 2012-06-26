Forestbase::Application.routes.draw do

  get "oppplayer/show"

  get "oppplayer/edit"

  get "oppplayer/update"

  match "/home"    => 'pages#home'
  
  match "/seasons" => 'seasons#index'
  match '/seasons/:id', :to => 'seasons#show' , :as => :season

  match "/players" => 'players#index'
  match '/players/:id', :to => 'players#show' , :as => :player
  
  match "/opponents" => 'opponents#index'
  match '/opponents/:id', :to => 'opponents#show' , :as => :opponent
  
  match '/oppplayers/:id', :to => 'oppplayers#show' , :as => :oppplayer

  match '/match/:id', :to => 'matches#show' , :as => :match
  
  root :to => 'pages#home'
end
