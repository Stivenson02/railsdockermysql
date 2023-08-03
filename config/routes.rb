Rails.application.routes.draw do
  devise_for :users

  root 'main#home'
  
  resources :home do
    collection do
      post :search
    end
  end
end
