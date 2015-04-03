NewsReader::Application.routes.draw do
  namespace :api do
    resources :feeds, only: [:index, :create, :show, :destroy] do
      resources :favorites, only: [:create]

      resources :entries, only: [:index]
    end
    resources :entries, only: [] do
      resources :favorites, only: [:create]
    end
  end


  resources :users, only: [:new, :create]
  resource :session, only: [:create, :destroy, :new]

  root to: "static_pages#index"
end
