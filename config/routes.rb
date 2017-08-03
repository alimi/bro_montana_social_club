Rails.application.routes.draw do
  resource :year, only: [:show, :create, :update] do
    resource :dues, only: [:edit, :update]
    resources :funds, only: [:create, :edit, :update]
    resources :potential_meeting_times, only: [:create]
  end

  resources :members, only: [:create, :edit, :update]
end
