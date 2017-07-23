Rails.application.routes.draw do
  resource :year, only: [:show, :create, :update] do
    resource :dues, only: [:edit, :update]
    resources :funds, only: [:create]
  end

  resources :members, only: [:create, :edit, :update]
end
