Rails.application.routes.draw do
  resources :invitations, only: [:update] do
    get :show, on: :collection
  end

  resources :payments, only: [:new] do
    get :create, on: :collection
  end

  resources :responses, only: [:create]
  resources :sessions, only: [:new, :create]
  resource :survey, only: [:show]

  root 'static_pages#home'
end
