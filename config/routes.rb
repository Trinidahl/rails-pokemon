Rails.application.routes.draw do
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "pokemons#index"
  resources :pokemons, only: %i[show] do
    resources :pokeballs, only: %i[new create]
  end
  resources :trainers, only: %i[index show new create] do
    resources :pokeballs, only: %i[show]
  end
  resources :pokeballs, only: %i[destroy]
  # root "posts#index"
end
