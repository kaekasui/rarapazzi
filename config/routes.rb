Rails.application.routes.draw do
  resources :events
  get 'example/index'

  resources :brands
  get 'beands/index'
end
