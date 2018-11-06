Rails.application.routes.draw do
  resources :word_lists
  root to: 'visitors#index'
end
