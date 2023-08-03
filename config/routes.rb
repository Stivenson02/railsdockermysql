Rails.application.routes.draw do
  devise_for :users

  root 'main#home'
  
  post 'create', to: 'callapi#create'
  get 'response', to: 'callapi#show'
end
