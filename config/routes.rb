Rails.application.routes.draw do
  devise_for :users, controllers: {
      passwords: 'users/passwords',
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [] do
    get 'create_teacher'
    get 'create_student'
  end
  resources :teachers, only: [] do
    resources :student_groups, except: [:show], shallow: true
  end
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
  get 'info', to: 'visitors#info'
  get 'student_select', to: 'teachers#student_select'
  get 'connect_from_link', to: 'teachers#connect_from_link'
  post 'join_teacher_group', to: 'teachers#join_teacher_group'
end
