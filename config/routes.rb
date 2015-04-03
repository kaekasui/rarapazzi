Rails.application.routes.draw do

  resources :brands do
    collection do
      get "dashboard"
    end
    resources :events
  end
  resources :events, only: [] do
    resources :photos
  end

  resources :contact

  root to: 'firstview#index'
end
