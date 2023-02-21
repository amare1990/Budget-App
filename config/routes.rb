Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :my_transactions
  end
  # resources :users

  root "splash_screen#show"

end
