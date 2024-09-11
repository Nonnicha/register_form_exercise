Rails.application.routes.draw do
  resources :registrations, only: [:index, :show, :create, :destroy, :edit, :update] do
    member do
      patch 'confirm_delete'
      patch 'close_confirm_delete_modal'
    end
  end
  # delete 'registrations/:id/confirm_delete', to: 'registrations#delete_data', as: 'delete_data'
  root 'registrations#new'
end
