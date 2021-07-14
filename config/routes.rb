Rails.application.routes.draw do
  scope "/api/v1" do
    resources :medicines
    resources :rewards
    resources :children
    resources :users
    resources :checklist_entries

    get '/children/:user_id', to: 'children#users_children', as: 'users_children'
    get '/checklist_entries/:child_id', to: 'checklist_entries#child_checklist_entries', as: 'child_checklist_entries'
    get '/rewards/:child_id', to: 'rewards#child_rewards', as: 'child_rewards'
  end

  scope '/users' do
    post '/login', to: 'users#login'
  end

  # get 'profiles/selectrole/', to: 'profiles#select_role', as: 'select_role'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
