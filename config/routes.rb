Rails.application.routes.draw do
  
  resources :boards

  get '/', to: 'boards#index'
end
