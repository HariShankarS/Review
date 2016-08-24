Rails.application.routes.draw do
  devise_for :users
  
  resources :movies do
    resources :reeviews, except: [:index, :show]
  end

  root 'movies#index'

end
