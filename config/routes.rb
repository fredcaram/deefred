Rails.application.routes.draw do
  resources :rsvp, only: [:show, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'main/index'

  root :to => "main#index"
  get "when_where" => "when_where#index"
  get "gallery" => 'gallery#index'
end
