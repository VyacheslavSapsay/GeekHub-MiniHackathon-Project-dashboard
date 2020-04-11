Rails.application.routes.draw do
  root 'categories#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  resources :categories, :posts

  resources :users do
    collection do
      get 'choose_categories'
      post 'choose_categories'
    end
  end


end
