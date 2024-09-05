Rails.application.routes.draw do
  resources :registrations , only: [:new, :create, :index]
  root 'registrations#new'
end
