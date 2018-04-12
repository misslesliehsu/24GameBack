Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        resources :games do
          resources :players, only: [:index, :create, :update, :destroy]
          resources :cards, only: [:create, :update]
        end
        mount ActionCable.server => '/cable'
      end
    end
end
