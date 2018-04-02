Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        resources :games
        resources :players, only: [:create]
        resources :cards, only: [:create, :update]
        mount ActionCable.server => '/cable'
      end
    end
end
