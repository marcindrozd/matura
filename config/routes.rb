Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :exams
    resources :users
    resources :groups
    resources :students
    resources :tasks
  end

  resources :exams, only: [] do
    put :set_current, on: :member
  end

  root 'admin/exams#index'
end
