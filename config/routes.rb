Rails.application.routes.draw do
  resources :tickets ,only: %i[create]
end
