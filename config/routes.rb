Rails.application.routes.draw do
  resource :responses, only: [:create]
  resource :session, only: [:new, :create]
  resource :survey, only: [:show]

  root 'static_pages#home'
end
