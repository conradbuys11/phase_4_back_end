Rails.application.routes.draw do
  resources :trainer_categories
  resources :trainers
  resources :pokemons
  resources :pokemon_moves
  resources :move_status_effects
  resources :status_effects
  resources :moves
  resources :species_types
  resources :species
  resources :types
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
