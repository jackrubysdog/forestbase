Forestbase::Application.routes.draw do
  
  match "/home"    => 'pages#home'
  
  match "/seasons" => 'seasons#index'
  match '/seasons/:id', :to => 'seasons#show' , :as => :season

  match "/players" => 'players#index'
  match '/players/:id', :to => 'players#show' , :as => :player
  
  root :to => 'pages#home'
end
