Rails.application.routes.draw do
  resources :games
  resources :players, only: [:create]
  resources :cards, only: [:create, :update]
  mount ActionCable.server => '/cable'
end
