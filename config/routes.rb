Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offices, only: :index
  get '/candidates/zip/:zip', to: 'candidates#by_zip'
end
