Rails.application.routes.draw do
  resources :registrations
  root 'registrations#new'
end
