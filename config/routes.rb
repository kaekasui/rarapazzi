Rails.application.routes.draw do
  get 'example/index'

  resources :brands do
    resources :events
  end
  resources :events, only: [] do
    resources :photos
  1
  end

  resources :contact

  resources :about

  resources :photos

  root to: 'example#index'
end
