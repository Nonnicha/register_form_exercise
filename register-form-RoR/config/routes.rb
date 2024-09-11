Rails.application.routes.draw do
  resources :registrations do
    member do
      get 'confirm_delete'
      patch 'close_confirm_delete_modal'
    end
  end
  # delete 'registrations/:id/confirm_delete', to: 'registrations#delete_data', as: 'delete_data'
  root 'registrations#new'
end
