Rails.application.routes.draw do
  resources :events
  get 'example/index'

  resources :brands
  get 'beands/index'

  resources :contact
  post 'contact/new'

  resources :about
  get 'about/index'
end
