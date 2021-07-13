Rails.application.routes.draw do
  resources :checklist_entries
  scope "/api/v1" do
    resources :medicines
    resources :checklists
    resources :rewards
    resources :children
    resources :users

    get '/user_id', to: 'children#index', as: 'select_user'
    get '/user_id/child_id/', to: 'checklists#index', as: 'child_checklist'
    get '/user_id/child_id/id', to: 'checklist#show', as: 'select_checklist'
  end

  # get 'profiles/selectrole/', to: 'profiles#select_role', as: 'select_role'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
