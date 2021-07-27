Rails.application.routes.draw do
  scope "/api/v1" do
    resources :medicines
    resources :rewards
    resources :children
    resources :users
    resources :checklist_entries

    # These are the routes for the added functionality
    scope '/children' do
      get '/entries/:id', to: 'children#child_checklist_entries', as: 'child_checklist_entries'
      get '/rewards/:id', to: 'rewards#child_rewards', as: 'child_rewards'
    end
    # These are the user routes
    scope '/users' do
      post '/login', to: 'users#login'
      post '/signup', to: 'users#signup'
      get '/reminders/:id', to: 'users#reminders'
    end
  end

  # get 'profiles/selectrole/', to: 'profiles#select_role', as: 'select_role'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
