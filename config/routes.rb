Forestbase::Application.routes.draw do

  match "/home"    => 'pages#home'
  
  match "/seasons" => 'seasons#index'
  match '/seasons/:id', :to => 'seasons#show' , :as => :season

  match "/players" => 'players#index'
  match '/players/:id', :to => 'players#show' , :as => :player
  
  match "/opponents" => 'opponents#index'
  match '/opponents/:id', :to => 'opponents#show' , :as => :opponent
  
  match '/oppplayer/:id', :to => 'oppplayers#show' , :as => :oppplayer

  match '/leaders' => 'leaders#show'
  
  match '/match/:id', :to => 'matches#show' , :as => :match

  match "/managers" => 'managers#index'
  match '/managers/:id', :to => 'managers#show' , :as => :manager

  match "/internationals" => 'internationals#index'
  match '/internationals/:id', :to => 'internationals#show' , :as => :international
  
  root :to => 'pages#home'
end
