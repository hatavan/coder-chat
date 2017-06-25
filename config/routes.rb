Rails.application.routes.draw do

  resources :friendships, only: [:create]
  delete 'remove_friend' => 'friendships#destroy'

  resources :messages
  get 'sent_messages' => 'messages#sent'

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  resources :sessions, only: [:create]

  get 'sign_up' => 'users#new'

  resources :users

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
