Rails.application.routes.draw do
  resources :users do
    member do 
      get :delete
    end
    collection do
      get :login
      post :authenticate
      get :signup
    end
  end

  resources :sessions do
    member do 
      get :delete
    end
  end

  resources :weather do
    member do 
      get :search
    end
  end

  resources :options do
    member do 
      get :common
    end
  end

  root 'common#index'
end
