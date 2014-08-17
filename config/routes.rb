Rails.application.routes.draw do
  resource :payment, only: [:new] do
    get :create, on: :collection
  end

  resource :response, only: [:create]
  resource :session, only: [:new, :create]
  resource :survey, only: [:show]

  root 'static_pages#home'
end
