Rails.application.routes.draw do
  get 'example/index'

  resources :brands do
    resources :events
  end
  resources :events, only: [] do
    resources :photos
  end

  resources :contact
  post 'contact/new'

  resources :about
  get 'about/index'

  root to: 'example#index'
end
