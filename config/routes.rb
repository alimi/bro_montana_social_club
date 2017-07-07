Rails.application.routes.draw do
  resource :year, only: [:show, :create, :update]
end
