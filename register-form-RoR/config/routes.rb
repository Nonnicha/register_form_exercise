Rails.application.routes.draw do
  resources :registrations do
    collection do
      get 'register_modal'
    end
    member do
      get 'confirm_delete'
    end
  end
  root 'registrations#new'
end
