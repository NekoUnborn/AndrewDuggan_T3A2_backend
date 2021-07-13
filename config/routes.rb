Rails.application.routes.draw do
  resources :medicines
  resources :checklists
  resources :rewards
  resources :children
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
