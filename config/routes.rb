Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :exams
    resources :users
    resources :tasks
    resources :groups do
      resources :students, only: [:index, :create] do
        put :update, on: :collection
      end
    end
  end

  resources :exams, only: [] do
    put :set_current, on: :member
  end

  root 'admin/exams#index'
end
