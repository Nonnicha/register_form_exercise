Rails.application.routes.draw do
  resources :registrations do
    member do
      get 'confirm_delete'
    end
  end
  root 'registrations#new'
end
