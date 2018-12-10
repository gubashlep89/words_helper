Rails.application.routes.draw do
  resources :questionnaires do
    member do
      get 'exam'
      post 'exam_result'
      post 'init_questionnaire'
    end
  end
  resources :words
  resources :word_lists do
    member do
      get 'random_word'
      get 'training'
      get 'testing'
      post 'test_result'
    end
  end
  root to: 'visitors#index'
end
