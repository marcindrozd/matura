Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :exams
    resources :users
    resources :groups
    resources :skills
    resources :students
    resources :tasks
  end

  root 'exams#index'
end
