Rails.application.routes.draw do
  resources :tickets, only: [:index]
end
