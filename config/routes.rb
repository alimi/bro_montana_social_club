Rails.application.routes.draw do
  resource :session, only: [:new, :create]
  resource :survey, only: [:show]
end
