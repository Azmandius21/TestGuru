Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #resources :tests

  #resource :account, controller: :account

  # resources :tests, only: %i[index show]

  # resources :tests do
  #   resources :questions
  # end

  resources :tests do
    resources :questions, shallow: true
  end
end
