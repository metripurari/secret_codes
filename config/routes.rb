Rails.application.routes.draw do

  devise_for :users

  resources :secret_codes
  resource :profile, only: :show

  # root :to => 'secret_codes#index'

  authenticated :user, ->(u) { !u.admin? } do
    root to: 'profiles#show'
  end

  authenticated :user, ->(u) { u.admin? } do
    root to: 'secret_codes#index'
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
