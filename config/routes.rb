Rails.application.routes.draw do
  devise_for :users

  resources :conversations do
    resources :messages do
      patch :toggle_seen
    end
  end
  root to: 'conversations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
