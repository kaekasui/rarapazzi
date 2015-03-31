Rails.application.routes.draw do
  resources :brands
  resources :photos
  resources :events
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
end
