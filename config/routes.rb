Rails.application.routes.draw do
  resources :words
  resources :word_lists do
    member do
      get 'random_word'
    end
  end
  root to: 'visitors#index'
end
