Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  #resources :tests

  #resource :account

  #resource :account, controller: :account, only: %i[show edit]


  # resources :tests, only: %i[index show]

   resources :tests do
     resources :questions
   end

  # resources :tests do
  #   resources :questions, shallow: true
  # end

  # get '/tests/:id/start', to: 'tests#start'

  #get '/tests/:id/start', to: 'tasks#start'

  # get '/tests/index', to: 'tests#index'

  # get 'tests/:id/show', to: 'tests#show'

end
