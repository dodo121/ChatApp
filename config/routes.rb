Rails.application.routes.draw do
  devise_for :users
  get 'messages_controller/create'

  resources :rooms do
    resources :messages
  end
  root to: 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
